import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kepuasanlayanan/app/modules/home/views/home_page.dart';
import 'package:kepuasanlayanan/app/modules/home/views/login_view.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var isAdmin = false.obs;

  // Fungsi login
  Future<void> login(String emailInput, String passwordInput) async {
    if (emailInput.isEmpty || passwordInput.isEmpty) {
      Get.snackbar("Error", "Email dan password tidak boleh kosong");
      return;
    }

    // Memeriksa kredensial admin
    if (emailInput == 'samsatkarangploso@gmail.com' && passwordInput == 'samsatkarlos') {
      isAdmin.value = true;
      email.value = emailInput;
      Get.offAll(HomePage(isAdmin: isAdmin.value));
      return;
    }

    // Memeriksa akun customer default
    if (emailInput == 'aku@gmail.com' && passwordInput == '12345678') {
      isAdmin.value = false;
      email.value = emailInput;
      Get.offAll(HomePage(isAdmin: isAdmin.value));
      return;
    }

    // Simulasi login dengan Firestore
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('signup')
          .where('email', isEqualTo: emailInput)
          .where('password', isEqualTo: passwordInput)
          .get();

      if (snapshot.docs.isNotEmpty) {
        email.value = emailInput;
        isAdmin.value = false; // Menandakan pengguna biasa
        Get.offAll(HomePage(isAdmin: isAdmin.value));
      } else {
        Get.snackbar("Error", "Email atau password salah");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    }
  }

  // Fungsi register
  Future<void> register(String emailInput, String passwordInput) async {
    if (emailInput.isEmpty || passwordInput.isEmpty) {
      Get.snackbar("Error", "Email dan password tidak boleh kosong");
      return;
    }

    try {
      // Simpan data pendaftaran ke Firestore
      await FirebaseFirestore.instance.collection('signup').add({
        'email': emailInput,
        'password': passwordInput, // Anda mungkin ingin mengenkripsi password
      });

      // Jika pendaftaran berhasil
      Get.snackbar("Sukses", "Pendaftaran berhasil. Silakan login.");
      // Kembali ke halaman login
      Get.back();
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    }
  }

  // Fungsi logout
  void logout() {
    email.value = '';
    isAdmin.value = false;
    Get.offAll(LoginView());
  }
}
