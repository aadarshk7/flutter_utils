import 'package:flutter/material.dart';
import 'media_player/models/media_file.dart';
import 'media_player/views/player_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PlayerScreen(
        mediaFiles: [
          MediaFile(
            title: "Video 1",
            path: "assets/videos/video1.mp4",
            isVideo: true,
            url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
          MediaFile(
            title: "Video 2",
            path: "assets/videos/video2.mp4",
            isVideo: true,
            url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
        ],
      ),
    );
  }
}
