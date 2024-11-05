import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:kepuasanlayanan/app/modules/home/controllers/complaint_controller.dart'; // Import for File

class ComplaintCustomerView extends StatelessWidget {
  final ComplaintController complaintController = Get.put(ComplaintController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengaduan")),
      body: SingleChildScrollView( // Wrap the body in SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => complaintController.name.value = value,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => complaintController.phoneNumber.value = value,
              decoration: InputDecoration(
                labelText: "Nomor Telepon",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => complaintController.email.value = value,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => complaintController.address.value = value,
              decoration: InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => complaintController.complaintText.value = value,
              decoration: InputDecoration(
                labelText: "Isi Pengaduan",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Obx(() {
              return Column(
                children: [
                  if (complaintController.imagePath.value.isNotEmpty) ...[
                    Image.file(
                      File(complaintController.imagePath.value),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                  ],
                  ElevatedButton(
                    onPressed: complaintController.pickImage,
                    child: Text("Unggah Bukti/Foto"),
                  ),
                ],
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: complaintController.submitComplaint,
              child: Text("Kirim Pengaduan"),
            ),
          ],
        ),
      ),
    );
  }
}
