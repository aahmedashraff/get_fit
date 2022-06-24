import 'dart:io';

import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';

// import 'package:chewie/chewie.dart';

class ExerciseVideo extends StatefulWidget {
  final String videoUrl;
  final MeeduPlayerController controller;
  final bool isLoacalVideo;

  const ExerciseVideo({
    Key key,
    this.videoUrl,
    this.controller,
    this.isLoacalVideo,
  }) : super(key: key);
  @override
  _ExerciseVideoState createState() => _ExerciseVideoState();
}

class _ExerciseVideoState extends State<ExerciseVideo> {
  // VideoPlayerController _controller;
  // ChewieController _chewieController;
  // final _meeduPlayerController = MeeduPlayerController(
  //     colorTheme: Color(0xFFEE6F57),
  //     controlsStyle: ControlsStyle.primary,
  //     pipEnabled: false,
  //     screenManager: ScreenManager(forceLandScapeInFullscreen: false));
  final _meeduPlayerController = MeeduPlayerController(
    colorTheme: Color(0xFFEE6F57),
    controlsStyle: ControlsStyle.primary,
    pipEnabled: false,
    screenManager: ScreenManager(forceLandScapeInFullscreen: false),
  );
  @override
  void initState() {
    if (widget.isLoacalVideo != null) {
      widget.controller.setDataSource(
        DataSource(
          type: DataSourceType.file,
          file: File(widget.videoUrl),
        ),
        autoplay: true,
        looping: true,
      );
    } else
      _meeduPlayerController
          .setDataSource(
        DataSource(
          type: DataSourceType.network,
          source: "$imageBase_URL/${widget.videoUrl}",
        ),
        autoplay: true,
        looping: true,
      ).then((e) {
        _meeduPlayerController.setMute(true);
      });

    super.initState();
  }

  @override
  void dispose() {
    _meeduPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: MeeduVideoPlayer(
        controller: widget.isLoacalVideo == null
            ? _meeduPlayerController
            : widget.controller,
      ),
      borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
    );
  }
}
