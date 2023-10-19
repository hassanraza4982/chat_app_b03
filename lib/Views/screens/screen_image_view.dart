import 'package:flutter/material.dart';

class ScreenImageView extends StatelessWidget {
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      backgroundColor: Colors.black,
      body: Center(child: InteractiveViewer(
        maxScale: 3000,
          minScale: 1,
          child: Image.network(url))),
    );
  }

  ScreenImageView({
    required this.url,
  });
}
