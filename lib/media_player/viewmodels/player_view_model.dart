import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../models/media_file.dart';

class PlayerViewModel extends ChangeNotifier {
  FlickManager? flickManager;
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  List<MediaFile> mediaFiles = [];
  int currentIndex = 0;

  void loadMediaFiles(List<MediaFile> files) {
    mediaFiles = files;
    loadMedia(mediaFiles[currentIndex]);
  }

  void loadMedia(MediaFile mediaFile) async {
    if (mediaFile.isVideo) {
      final directory = await getApplicationDocumentsDirectory();
      // ignore: unused_local_variable
      final filePath = '${directory.path}/${mediaFile.path}';
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(mediaFile.url),
      );
      flickManager!.flickVideoManager!.videoPlayerController?.addListener(() {
        position = flickManager!.flickVideoManager!.videoPlayerController!.value.position;
        duration = flickManager!.flickVideoManager!.videoPlayerController!.value.duration;
        notifyListeners();
      });
      await flickManager!.flickVideoManager!.videoPlayerController?.initialize();
      notifyListeners();
    }
  }

  void play() {
    flickManager?.flickControlManager?.play();
    isPlaying = true;
    notifyListeners();
  }

  void pause() {
    flickManager?.flickControlManager?.pause();
    isPlaying = false;
    notifyListeners();
  }

  void replay() {
    flickManager?.flickControlManager?.replay();
    isPlaying = true;
    notifyListeners();
  }

  void next() {
    if (currentIndex < mediaFiles.length - 1) {
      currentIndex++;
      loadMedia(mediaFiles[currentIndex]);
    }
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
      loadMedia(mediaFiles[currentIndex]);
    }
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }
}
