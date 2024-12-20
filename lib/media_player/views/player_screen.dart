import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flick_video_player/flick_video_player.dart';
import '../viewmodels/player_view_model.dart';
import '../models/media_file.dart';

class PlayerScreen extends StatelessWidget {
  final List<MediaFile> mediaFiles;

  PlayerScreen({required this.mediaFiles});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerViewModel()..loadMediaFiles(mediaFiles),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Media Player', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Consumer<PlayerViewModel>(
          builder: (context, viewModel, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (viewModel.flickManager != null &&
                    viewModel.flickManager!.flickVideoManager!
                        .videoPlayerController!.value.isInitialized)
                  AspectRatio(
                    aspectRatio: viewModel.flickManager!.flickVideoManager!
                        .videoPlayerController!.value.aspectRatio,
                    child:
                        FlickVideoPlayer(flickManager: viewModel.flickManager!),
                  )
                else
                  CircularProgressIndicator(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: viewModel.previous,
                    ),
                    IconButton(
                      icon: Icon(
                          viewModel.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white),
                      onPressed: viewModel.isPlaying
                          ? viewModel.pause
                          : viewModel.play,
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next, color: Colors.white),
                      onPressed: viewModel.next,
                    ),
                  ],
                ),
                Text(
                  '${viewModel.position.inMinutes}:${(viewModel.position.inSeconds % 60).toString().padLeft(2, '0')} / ${viewModel.duration.inMinutes}:${(viewModel.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
