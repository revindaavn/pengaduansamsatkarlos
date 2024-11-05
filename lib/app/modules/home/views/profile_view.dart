// profile_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuasanlayanan/app/modules/home/controllers/profile_controller.dart';
import 'setting_view.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile picture
            Obx(() => CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profileController.profileImage.value),
                )),
            SizedBox(height: 10),
            // Username
            Obx(() => Text(
                  profileController.username.value,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 30),
            
            // Settings and logout buttons
            ElevatedButton(
              onPressed: () {
                Get.to(() => SettingsView());
              },
              child: Text("Settings"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Log out and navigate back to login view
                Get.offAll(LoginView());
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
