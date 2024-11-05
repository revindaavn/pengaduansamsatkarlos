import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kepuasanlayanan/app/modules/home/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widget binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp()); // Run the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Kepuasan Samsat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(), // Halaman pertama aplikasi
    );
  }
}
