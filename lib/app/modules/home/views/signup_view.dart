import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuasanlayanan/app/modules/home/controllers/auth_controller.dart';

class SignUpView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Panggil fungsi register di AuthController
                  await authController.register(
                    emailController.text.trim(), // Menghapus spasi di awal/akhir
                    passwordController.text.trim(),
                  );

                  // Kosongkan text field setelah pendaftaran
                  emailController.clear();
                  passwordController.clear();
                },
                child: Text("Sign Up"),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.back(); // Kembali ke halaman login
                },
                child: Text("Kamu sudah punya akun? Log in disini"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
