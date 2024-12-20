// import 'package:flutter/material.dart';
// import '../../viewmodels/player_view_model.dart';
//
// class ControlsWidget extends StatelessWidget {
//   final PlayerViewModel viewModel;
//
//   ControlsWidget({required this.viewModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: Icon(Icons.stop, color: Colors.redAccent, size: 30),
//           onPressed: viewModel.stop,
//         ),
//         IconButton(
//           icon: Icon(
//             viewModel.isPlaying
//                 ? Icons.pause_circle_filled
//                 : Icons.play_circle_fill,
//             color: Colors.white,
//             size: 50,
//           ),
//           onPressed: viewModel.isPlaying ? viewModel.pause : viewModel.play,
//         ),
//       ],
//     );
//   }
// }
