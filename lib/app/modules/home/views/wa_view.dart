import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WaView extends StatelessWidget {
  final String phoneNumber;
  final String defaultMessage;

  WaView({required this.phoneNumber, required this.defaultMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hubungi Admin")),
      body: Center(
        child: ElevatedButton(
          onPressed: launchWhatsApp,
          child: Text("Tanya Admin di WhatsApp"),
        ),
      ),
    );
  }

void launchWhatsApp() async {
  final String phoneNumber = '628883390000'; // Ensure this is in the correct format
  final String defaultMessage = 'Hi, I have a question about the service.'; // Default message
  final String url = 'https://api.whatsapp.com/send/?phone=$phoneNumber&text=${Uri.encodeComponent(defaultMessage)}&app_absent=0';
  
  print('Launching WhatsApp with URL: $url'); // Debug print

  // Check if the URL can be launched
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // Show an error message to the user
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text('Could not launch WhatsApp. Please check if it is installed.'),
      ),
    );
  }
}

}
