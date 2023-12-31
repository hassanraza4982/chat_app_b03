import 'dart:io';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:mondaytest/controller/chat_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../Models/Student.dart';
import '../../helper/constants.dart';
import '../../helper/firebase_helpers.dart';

class ScreenVideoPlay extends StatefulWidget {
  Student? receiver;
  String path;

  @override
  State<ScreenVideoPlay> createState() => _ScreenVideoPlayState();

  ScreenVideoPlay({
    this.receiver,
    required this.path,
  });
}

class _ScreenVideoPlayState extends State<ScreenVideoPlay> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the VideoPlayerController with the video file path
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown and update the state
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    // Dispose of the VideoPlayerController when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController(
      receiver_id: widget.receiver!.id,
    ));

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : CircularProgressIndicator(), // Show loading indicator while initializing
              )),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              leading: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.black54, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              trailing: Container(
                width: Get.width * 0.67,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.hd,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.sticky_note_2_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.text_fields_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    color: Colors.black54, shape: BoxShape.circle),
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 55,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightGreen.shade500,
                  ),
                  // child: ListTile(
                  //   leading: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.add_photo_alternate_rounded,
                  //         size: 25,
                  //         color: Colors.white,
                  //       )),
                  //   title: TextField(
                  //     maxLines: null,
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         hintText: 'Add a caption...',
                  //         hintStyle: TextStyle(
                  //           color: Colors.white,
                  //
                  //         )
                  //     ),
                  //   ),
                  //   trailing: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.repeat_one_rounded,
                  //         size: 25,
                  //         color: Colors.white,
                  //       )),
                  // )
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_photo_alternate_rounded,
                            size: 25,
                            color: Colors.white,
                          )),
                      Container(
                        width: Get.width * 0.65,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add a caption...',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.repeat_one_rounded,
                            size: 25,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey,
                        ),
                        child: Text(
                          widget.receiver!.name,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                    FloatingActionButton(
                      onPressed: () async {
                        var thumbnail = await getVideoThumbnail(widget.path);
                        var hash = getBlurHash(thumbnail);

                        var url = await FirebaseStorageUtils.uploadImage(
                            File(widget.path),
                            'video/${chatController.getRoomId(widget.receiver!.id, currentUser!.uid)}',
                            DateTime.now().millisecondsSinceEpoch.toString());
                        chatController.sendMessage(url,
                            type: "video", blurhash: hash);
                        Get.back();
                      },
                      backgroundColor: Color(0xFF075e55),
                      child: Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getBlurHash(File file) {
    final data = file.readAsBytesSync();
    final image = img.decodeImage(data);
    final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);
    print(blurHash.hash);
    return blurHash.hash;
  }

  Future<File> getVideoThumbnail(String url) async {
    var thumbTempPath = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight: 64,
      // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75, // you can change the thumbnail quality here
    );
    return File(thumbTempPath!);
  }
}

class MyVideoPlayer extends StatefulWidget {
  final String videoUrl;

  MyVideoPlayer({required this.videoUrl});

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying = !_isPlaying;
          if (_isPlaying) {
            _controller.play();
          } else {
            _controller.pause();
          }
        });
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          if (!_isPlaying)
            Center(
              child: Icon(
                Icons.play_arrow,
                size: 50,
              ),
            ),
        ],
      ),
    );
  }
}