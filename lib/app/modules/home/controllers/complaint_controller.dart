import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ComplaintController extends GetxController {
  var name = ''.obs;
  var phoneNumber = ''.obs;
  var email = ''.obs;
  var address = ''.obs;
  var complaintText = ''.obs;
  var imagePath = ''.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    // Show a dialog to choose between camera and gallery
    final source = await Get.defaultDialog(
      title: "Pilih Sumber Gambar",
      middleText: "Silakan pilih sumber gambar yang ingin digunakan.",
      textCancel: "Gallery",
      textConfirm: "Kamera",
      onCancel: () async {
        final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          imagePath.value = pickedFile.path; // Get the path of the image
        }
      },
      onConfirm: () async {
        final pickedFile = await _picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          imagePath.value = pickedFile.path; // Get the path of the image
        }
      },
    );
  }

  void submitComplaint() {
    // Handle the submission logic here (e.g., send to server)
    // You can also validate the fields before submission
    print("Name: ${name.value}");
    print("Phone: ${phoneNumber.value}");
    print("Email: ${email.value}");
    print("Address: ${address.value}");
    print("Complaint: ${complaintText.value}");
    print("Image Path: ${imagePath.value}");
  }
}
