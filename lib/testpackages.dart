import 'dart:async';
import 'dart:developer';

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/selectLanguage.dart';
import 'package:MCC/widgets/SettingsListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class testpackages extends StatefulWidget {
  const testpackages({super.key});

  @override
  State<testpackages> createState() => _SettingsPageState();
}

// GlobalKey<NavigatorState> SettingsPageNavigatorKey000000 =
//     GlobalKey<NavigatorState>();

class _SettingsPageState extends State<testpackages> {
  late FlickManager flickManager;
  late VideoPlayerController _controller;

  @override
  String videoUrl2 =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(videoUrl2),
    ));
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Scaffold(
          appBar: AppBar(
            leading: const Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: 25,
                  color: Colors.black54,
                ),
              ],
            ),
            actions: [
              Text(
                S.of(context).Settings,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black54),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    // Share.share('check out my website https://example.com',
                    //     subject: 'Look what I made!');
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Text('video toogle')),
                Container(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                ),
                Container(
                  child: FlickVideoPlayer(flickManager: flickManager),
                )
              ],
            ),
          )),
    );
  }
}
