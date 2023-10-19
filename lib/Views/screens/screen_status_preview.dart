import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondaytest/Views/layouts/screen_status.dart';

import '../../controller/status_controller.dart';
import 'dart:io';


class StatusPreviewScreen extends StatelessWidget {
  final RxString mediaPath;
  final String mediaType;

  StatusPreviewScreen({
    required this.mediaPath,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (mediaType == 'image')
              Image.file(
                File(mediaPath.value),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            if (mediaType == 'video')
            // Implement video preview widget for videos
              Text('Video Preview Widget Placeholder'),
            if (mediaType == 'text')
              Text(
                mediaPath.value,
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Call the sendStatus function from your StatusController
                // to send the selected status to your backend or storage.
                Get.find<StatusController>().sendStatus();
                // Get.to(ScreenStatus());
                 Get.back(); // Navigate back to the previous screen.
              },
              child: Text('Send Status'),
            ),
          ],
        ),
      ),
    );
  }
}
