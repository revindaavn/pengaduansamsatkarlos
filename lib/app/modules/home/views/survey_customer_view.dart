import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuasanlayanan/app/modules/home/controllers/survey_controller.dart';

class SurveyCustomerView extends StatelessWidget {
  // Initialize the controller
  final SurveyController surveyController = Get.put(SurveyController());

  // Keep track of whether we're on the suggestion screen
  final RxBool isSuggestionVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Survey")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          // Check if we are showing the suggestion input field
          if (isSuggestionVisible.value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "6. Apakah ada saran yang anda ingin sampaikan?",
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  onChanged: (value) => surveyController.updateSuggestion(value), // Update suggestion
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan saran Anda di sini",
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    surveyController.submitSurvey(); // Submit the survey
                    Get.back(); // Go back after submission
                  },
                  child: Text("Kirim"),
                ),
              ],
            );
          } else {
            // If not on suggestion screen, show survey questions
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. Apakah petugas kami melayani dengan ramah dan sopan?",
                  style: TextStyle(fontSize: 16),
                ),
                buildResponseBoxes(0), // Question 1

                SizedBox(height: 20),

                Text(
                  "2. Seberapa cepat layanan yang Anda terima?",
                  style: TextStyle(fontSize: 16),
                ),
                buildResponseBoxes(1), // Question 2

                SizedBox(height: 20),

                Text(
                  "3. Apakah informasi yang diberikan sudah cukup jelas dan mudah dipahami?",
                  style: TextStyle(fontSize: 16),
                ),
                buildResponseBoxes(2), // Question 3

                SizedBox(height: 20),

                Text(
                  "4. Apakah Anda merasa nyaman dengan fasilitas yang ada di kantor Samsat kami?",
                  style: TextStyle(fontSize: 16),
                ),
                buildResponseBoxes(3), // Question 4

                SizedBox(height: 20),

                Text(
                  "5. Seberapa puas Anda secara keseluruhan dengan layanan kami?",
                  style: TextStyle(fontSize: 16),
                ),
                buildResponseBoxes(4), // Question 5

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    isSuggestionVisible.value = true; // Show suggestion input
                  },
                  child: Text("Selanjutnya"),
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  // Function to build response boxes for each question
  Widget buildResponseBoxes(int questionIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(5, (index) {
        return Obx(() => GestureDetector(
              onTap: () {
                surveyController.updateResponse(questionIndex, index + 1); // Update response
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: surveyController.responses[questionIndex] == index + 1
                      ? Colors.blue // Selected color
                      : Colors.grey, // Default color
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ));
      }),
    );
  }
}
