import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  // Inisialisasi Firebase Auth dan Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observasi data pengguna
  RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  // Store responses for each survey question
  var responses = List<int?>.filled(5, null).obs; // 5 questions, initially null
  var suggestion = ''.obs; // Store suggestion

  @override
  void onInit() {
    super.onInit();
    fetchUserData(); // Panggil saat controller diinisialisasi
  }

  // Fungsi untuk mengambil data pengguna dari Firestore
  Future<void> fetchUserData() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(currentUser.uid).get();
        if (userDoc.exists) {
          userData.assignAll(userDoc.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      print('Gagal mengambil data pengguna: $e');
    }
  }

  // Fungsi untuk menyimpan atau memperbarui data pengguna di Firestore
  Future<void> updateUserData(Map<String, dynamic> newUserData) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _firestore.collection('survey').doc(currentUser.uid).update(newUserData);
        userData.assignAll(newUserData);
      }
    } catch (e) {
      print('Gagal memperbarui data pengguna: $e');
    }
  }

  // Function to update response for each question
  void updateResponse(int questionIndex, int value) {
    responses[questionIndex] = value;
  }

  // Function to update suggestion
  void updateSuggestion(String value) {
    suggestion.value = value;
  }

  // Function to submit the survey to Firestore
  Future<void> submitSurvey() async {
    if (responses.contains(null)) {
      Get.snackbar("Error", "Pastikan semua pertanyaan sudah dijawab.");
      return;
    }

    try {
      await _firestore.collection('survey').add({
        'userId': _auth.currentUser?.uid ?? "guest",
        'responses': responses.map((r) => r ?? 0).toList(),
        'suggestion': suggestion.value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar("Sukses", "Survei Anda telah terkirim.");

      // Reset responses and suggestion after submission
      responses.value = List<int?>.filled(5, null);
      suggestion.value = '';
    } catch (e) {
      Get.snackbar("Error", "Gagal mengirim survei: $e");
    }
  }
}
