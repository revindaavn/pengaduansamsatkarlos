// setting_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuasanlayanan/app/modules/home/controllers/profile_controller.dart';

class SettingsView extends StatelessWidget {
  final ProfileController profileController = Get.find();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize the text field with the current username
    usernameController.text = profileController.username.value;

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profileController.profileImage.value),
                )),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Here, update the profile picture. Replace with an actual image selection method
                String newImagePath = 'assets/new_profile_image.png'; // Example path
                profileController.updateProfile(profileController.username.value, newImagePath);
              },
              child: Text("Change Profile Picture"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save changes to username and return to ProfileView
                profileController.updateProfile(usernameController.text, profileController.profileImage.value);
                Get.back(); // Navigate back to ProfileView
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
