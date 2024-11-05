import 'package:flutter/material.dart';

class InformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Informasi Samsat Karangploso")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat datang di Samsat Karangploso",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Jadwal Pelayanan:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Senin - Jumat: 08:30 - 14:00",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Sabtu: 08:00 - 12:00",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Minggu: Tutup",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Informasi Lainnya:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "1. Proses pendaftaran kendaraan baru.",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "2. Pembayaran pajak kendaraan bermotor.",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "3. Pengurusan STNK dan BPKB.",
                style: TextStyle(fontSize: 16),
              ),
              // Add more information as needed
            ],
          ),
        ),
      ),
    );
  }
}
