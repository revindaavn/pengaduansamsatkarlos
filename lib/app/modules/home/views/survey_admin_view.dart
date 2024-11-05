import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyAdminView extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey Responses"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('surveys').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("Belum ada customer yang mengisi survei."),
              );
            }

            // Jika ada data survei
            final surveyDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: surveyDocs.length,
              itemBuilder: (context, index) {
                final surveyData = surveyDocs[index].data() as Map<String, dynamic>;

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text(surveyData['name'] ?? surveyData['email'] ?? "Unknown"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${surveyData['email'] ?? 'Tidak tersedia'}"),
                        SizedBox(height: 4),
                        Text("Tanggal: ${surveyData['date'] ?? 'Tidak tersedia'}"),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(SurveyDetailView(surveyData: surveyData));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SurveyDetailView extends StatelessWidget {
  final Map<String, dynamic> surveyData;

  SurveyDetailView({required this.surveyData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${surveyData['name'] ?? 'Tidak tersedia'}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Email: ${surveyData['email'] ?? 'Tidak tersedia'}"),
            SizedBox(height: 8),
            Text("Date: ${surveyData['date'] ?? 'Tidak tersedia'}"),
            SizedBox(height: 16),
            Divider(),
            Text(
              "Survey Responses",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Question ${index + 1}: ${surveyData['question${index + 1}'] ?? 'Tidak ada jawaban'}"),
              );
            }),
            SizedBox(height: 16),
            Divider(),
            Text(
              "Suggestion",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(surveyData['suggestion'] ?? "Tidak ada saran"),
          ],
        ),
      ),
    );
  }
}
