import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Models/status_model.dart';
import '../Views/screens/screen_status_preview.dart';

class StatusController extends GetxController {
  RxString imageStatusPath = ''.obs;
  RxString videoStatusPath = ''.obs;
  RxString textStatus = ''.obs;
  Rx<StatusModel?> selectedStatus = Rx<StatusModel?>(null);

  // Method to pick an image status
  Future<void> pickImageStatus() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var file = File(pickedFile.path);
      imageStatusPath.value = file.path;
      // Open the status preview screen for images
      // You might want to create a similar screen for videos.
      Get.to(StatusPreviewScreen(
        mediaPath: imageStatusPath,
        mediaType: 'image',
      ));
    }
  }

  // Method to send the status
  Future<void> sendStatus() async {
    String? statusContent = '';
    String? mediaType = '';

    if (imageStatusPath.isNotEmpty) {
      statusContent = imageStatusPath.value;
      mediaType = 'image';
    } else if (videoStatusPath.isNotEmpty) {
      statusContent = videoStatusPath.value;
      mediaType = 'video';
    } else if (textStatus.isNotEmpty) {
      statusContent = textStatus.value;
      mediaType = 'text';
    }

    if (statusContent.isNotEmpty) {
      // Handle sending the status to your backend or storage.
      // For example, upload image or video content to Firebase Storage.

      if (mediaType == 'image' || mediaType == 'video') {
        String url = await uploadMedia(statusContent, mediaType);
        if (url.isNotEmpty) {
          // Here, you can handle the uploaded URL or other status data.
          // For example, update a list of statuses.

          // Clear selected status paths and text status.
          clearImageStatus();
          clearVideoStatus();
          updateTextStatus('');
        }
      }

      // Handle text status or other logic here.

      // After handling the status update, you can add it to a list of statuses.
      // statusList.add(StatusModel(content: statusContent, mediaType: mediaType));
    }
  }

  // Method to clear the image status
  void clearImageStatus() {
    imageStatusPath.value = '';
  }

  // Method to clear the video status
  void clearVideoStatus() {
    videoStatusPath.value = '';
  }

  // Method to update the text status
  void updateTextStatus(String status) {
    textStatus.value = status;
  }

  // Method to upload media to a storage service (e.g., Firebase Storage)
  Future<String> uploadMedia(String path, String mediaType) async {
    try {
      // You can implement the logic for uploading media to a storage service.
      // For example, upload to Firebase Storage and return the download URL.
      // Replace this with your actual media upload logic.

      // For now, we'll return a placeholder URL as an example.
      return 'https://example.com/your_uploaded_media_url';
    } catch (e) {
      print('Error uploading media: $e');
      return '';
    }
  }
}
