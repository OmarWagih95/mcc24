// import 'package:MCC/generated/l10n.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:video_player/video_player.dart';

// class Categoryvideo extends StatefulWidget {
//   const Categoryvideo({super.key});

//   @override
//   State<Categoryvideo> createState() => _SettingsPageState();
// }

// // GlobalKey<NavigatorState> SettingsPageNavigatorKey000000 =
// //     GlobalKey<NavigatorState>();

// class _SettingsPageState extends State<Categoryvideo> {
//   late FlickManager flickManager;
//   late VideoPlayerController _controller;

//   @override
//   String videoUrl2 =
//       'https://firebasestorage.googleapis.com/v0/b/mmctest-18030.appspot.com/o/videos%2F%E2%80%AACourse_%20Mastering%20Flutter_%20Responsive%20%26%20Adaptive%20UI%20Design%20%5BArabic%5D%20_%20Udemy%20-%20Google%20Chrome%E2%80%AC%202024-01-15%2012-00-51.mp4?alt=media&token=af4ab932-a9eb-4b36-96f3-11168a6cf550';
//   // String videoUrl =
//   //     "https://firebasestorage.googleapis.com/v0/b/mmctest-18030.appspot.com/o/videos%2F%E2%80%AACourse_%20Mastering%20Flutter_%20Responsive%20%26%20Adaptive%20UI%20Design%20%5BArabic%5D%20_%20Udemy%20-%20Google%20Chrome%E2%80%AC%202024-01-15%2012-00-51.mp4?alt=media&token=af4ab932-a9eb-4b36-96f3-11168a6cf550";
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//         videoPlayerController: VideoPlayerController.networkUrl(
//       Uri.parse(videoUrl2),
//     ));
//     // _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
//     //   ..initialize().then((_) {
//     //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//     //     setState(() {});
//     //   });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
//       child: Scaffold(
//           appBar: AppBar(
//             leading: const Row(
//               children: [
//                 Icon(
//                   Icons.notifications,
//                   size: 25,
//                   color: Colors.black54,
//                 ),
//               ],
//             ),
//             actions: [
//               Text(
//                 S.of(context).Settings,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                     color: Colors.black54),
//               )
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 // ElevatedButton(
//                 //     // Share.share('check out my website https://example.com',
//                 //     //     subject: 'Look what I made!');
//                 //     onPressed: () {
//                 //       setState(() {
//                 //         _controller.value.isPlaying
//                 //             ? _controller.pause()
//                 //             : _controller.play();
//                 //       });
//                 //     },
//                 //     child: Text('video toogle')),
//                 // Container(
//                 //   child: _controller.value.isInitialized
//                 //       ? AspectRatio(
//                 //           aspectRatio: _controller.value.aspectRatio,
//                 //           child: VideoPlayer(_controller),
//                 //         )
//                 //       : Container(),
//                 // ),
//                 Container(
//                   padding: EdgeInsets.all(8),
//                   child: FlickVideoPlayer(flickManager: flickManager),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
