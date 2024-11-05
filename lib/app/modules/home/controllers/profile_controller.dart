import 'package:get/get.dart';

class ProfileController extends GetxController {
  var username = 'Username'.obs;
  var profileImage = 'assets/profile_placeholder.png'.obs; // Default profile image

  void updateProfile(String newUsername, String newProfileImage) {
    username.value = newUsername;
    profileImage.value = newProfileImage;
  }
}
