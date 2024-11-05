import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuasanlayanan/app/modules/home/views/complaint_admin_view.dart';
import 'package:kepuasanlayanan/app/modules/home/views/complaint_customer_view.dart';
import 'package:kepuasanlayanan/app/modules/home/views/information_view.dart';
import 'package:kepuasanlayanan/app/modules/home/views/profile_view.dart';
import 'package:kepuasanlayanan/app/modules/home/views/survey_admin_view.dart';
import 'package:kepuasanlayanan/app/modules/home/views/survey_customer_view.dart';
import 'package:kepuasanlayanan/app/modules/home/views/wa_view.dart';

class HomePage extends StatelessWidget {
  final bool isAdmin; // Menyimpan status admin

  HomePage({required this.isAdmin}); // Menerima status admin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/logo/logoSAMSAT.png', height: 150),
          ),
          SizedBox(height: 20),

          // Features Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FeatureBox(
                assetImage: 'assets/logo/survey.png',
                label: "Survey",
                onTap: () {
                  if (isAdmin) {
                    // Jika admin, navigasi ke halaman yang menampilkan daftar customer
                    Get.to(SurveyAdminView());
                  } else {
                    // Jika customer, navigasi ke halaman survey customer
                    Get.to(SurveyCustomerView());
                  }
                },
              ),
              FeatureBox(
                assetImage: 'assets/logo/pertanyaan.png',
                label: "Pertanyaan",
                onTap: () {
                  Get.to(WaView(
                    phoneNumber: '+628883390000',
                    defaultMessage: 'Halo admin, saya ingin menanyakan informasi mengenai layanan di Samsat Karangploso...',
                  ));
                },
              ),
              FeatureBox(
                assetImage: 'assets/logo/pengaduan.png',
                label: "Pengaduan",
                onTap: () {
                  if (isAdmin) {
                    // Jika admin, navigasi ke ComplaintAdminView
                    Get.to(ComplaintAdminView());
                  } else {
                    // Jika customer, navigasi ke ComplaintCustomerView
                    Get.to(ComplaintCustomerView());
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FeatureBox(
                assetImage: 'assets/logo/informasi.png',
                label: "Informasi",
                onTap: () {
                  Get.to(InformationView());
                },
              ),
            ],
          ),

          // Menambahkan fitur tambahan jika admin
          if (isAdmin)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FeatureBox(
                  assetImage: 'assets/logo/informasi.png',
                  label: "Admin Dashboard",
                  onTap: () {
                    // Tambahkan logika untuk halaman dashboard admin jika diperlukan
                  },
                ),
              ],
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Get.offAll(HomePage(isAdmin: isAdmin)); // Navigasi ke home
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Get.to(ProfileView()); // Navigasi ke profile
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureBox extends StatelessWidget {
  final String? assetImage;
  final String label;
  final VoidCallback onTap;

  const FeatureBox({
    this.assetImage,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            assetImage != null
                ? Image.asset(assetImage!, height: 60)
                : Icon(Icons.help, size: 40, color: Colors.white),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
