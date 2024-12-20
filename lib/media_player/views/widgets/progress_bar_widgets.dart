// import 'package:flutter/material.dart';
// import '../../viewmodels/player_view_model.dart';
//
// class ProgressBarWidget extends StatelessWidget {
//   final PlayerViewModel viewModel;
//
//   ProgressBarWidget({required this.viewModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Slider(
//           min: 0,
//           max: viewModel.duration.inSeconds.toDouble(),
//           value: viewModel.position.inSeconds.toDouble(),
//           onChanged: (value) {
//             final position = Duration(seconds: value.toInt());
//             if (viewModel.videoController != null) {
//               viewModel.videoController!.seekTo(position);
//             } else {
//               viewModel.audioPlayer!.seek(position);
//             }
//           },
//           activeColor: Colors.tealAccent,
//           inactiveColor: Colors.white38,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               formatDuration(viewModel.position),
//               style: TextStyle(color: Colors.white70),
//             ),
//             Text(
//               formatDuration(viewModel.duration),
//               style: TextStyle(color: Colors.white70),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   String formatDuration(Duration duration) {
//     return [duration.inMinutes, duration.inSeconds % 60]
//         .map((seg) => seg.toString().padLeft(2, '0'))
//         .join(':');
//   }
// }
