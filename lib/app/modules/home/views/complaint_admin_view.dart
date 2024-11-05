import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ComplaintAdminView extends StatelessWidget {
  final TextEditingController responseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Keluhan Pelanggan"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('complaints').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Belum ada keluhan dari pelanggan"));
          }

          var complaints = snapshot.data!.docs;

          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              var complaintData = complaints[index];
              String customerEmail = complaintData['email'];
              String complaintText = complaintData['complaint'];
              String? response = complaintData['response'];

              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email: $customerEmail",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text("Keluhan: $complaintText"),
                      SizedBox(height: 8),
                      if (response != null) ...[
                        Text("Tanggapan Admin:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(response),
                      ],
                      if (response == null) ...[
                        TextField(
                          controller: responseController,
                          decoration: InputDecoration(
                            labelText: "Tanggapan Admin",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => _submitResponse(complaintData.id),
                          child: Text("Kirim Tanggapan"),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _submitResponse(String complaintId) async {
    String responseText = responseController.text.trim();
    if (responseText.isEmpty) {
      Get.snackbar("Error", "Tanggapan tidak boleh kosong");
      return;
    }

    try {
      // Simpan tanggapan admin ke Firestore
      await FirebaseFirestore.instance
          .collection('complaints')
          .doc(complaintId)
          .update({'response': responseText});

      // Bersihkan text controller setelah sukses
      responseController.clear();
      Get.snackbar("Sukses", "Tanggapan berhasil dikirim");
    } catch (e) {
      Get.snackbar("Error", "Gagal mengirim tanggapan: $e");
    }
  }
}
