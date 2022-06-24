import 'package:flutter/material.dart';

class VideoContainer extends StatefulWidget {
  // final YoutubePlayerController controller;
  final String videoId;
  VideoContainer(this.videoId);

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  // YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   _controller = YoutubePlayerController(
  //     initialVideoId: widget.videoId,
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: true,
  //       loop: true,
  //     ),
  //   );

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
    //     child: Stack(
    //       children: [
    //         YoutubePlayerBuilder(
    //           player: YoutubePlayer(
    //             controller: _controller,

    //             width: SizeConfig.safeBlockHorizontal * 100,
    //            // aspectRatio: 2.1,
    //             progressColors: ProgressBarColors(
    //               playedColor: Theme.of(context).primaryColor,
    //               backgroundColor:
    //                   Theme.of(context).primaryColor.withOpacity(.3),
    //               bufferedColor: Theme.of(context).primaryColor.withOpacity(.3),
    //               handleColor: Theme.of(context).primaryColor,
    //             ),
    //             progressIndicatorColor: Theme.of(context).primaryColor,

    //             //showVideoProgressIndicator: true,
    //           ),
    //           builder: (_, player) => player,
    //         ),
    //         Positioned(
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 border: Border.all(color: Colors.transparent)),
    //             width: SizeConfig.safeBlockHorizontal * 22,
    //             height: SizeConfig.blockSizeVertical * 8,
    //           ),
    //           bottom: 0,
    //           right: 0,
    //         )
    //         // this previous container is made to cover the full screen button
    //         // and prevent user from pressig it
    //       ],
    //     ),
    //   ),
    //  // width: SizeConfig.safeBlockHorizontal * 100,
    //   decoration: BoxDecoration(
    //     // boxShadow: [
    //     //   BoxShadow(
    //     //     color: Colors.black.withOpacity(.5),
    //     //     blurRadius: 4,
    //     //     // spreadRadius: 4,
    //     //     offset: Offset(0, SizeConfig.safeBlockVertical *5.25),
    //     //   ),
    //     // ],
    //   ),
    );
  }
}
