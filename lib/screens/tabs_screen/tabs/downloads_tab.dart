import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/exercise_video.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';

class DownloadsTabs extends StatefulWidget {
  @override
  _DownloadsTabsState createState() => _DownloadsTabsState();
}

class _DownloadsTabsState extends State<DownloadsTabs> {
  final _meeduPlayerController = MeeduPlayerController(
    colorTheme: Color(0xFFEE6F57),
    controlsStyle: ControlsStyle.primary,
    pipEnabled: false,
    screenManager: ScreenManager(forceLandScapeInFullscreen: false),
  );
  @override
  void dispose() {
    _meeduPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: getDownloads(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView.builder(
            itemBuilder: (_, i) {
              final dwonloadData = snapshot.data[i].split("&&");

              return ListTile(
                key: ValueKey(dwonloadData[1]),
                leading: ClipRRect(
                  child: Image.network(
                    "$imageBase_URL/${dwonloadData[4]}",
                    width: SizeConfig.safeBlockHorizontal * 33,
                    height: SizeConfig.safeBlockVertical * 10,
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal),
                ),
                title: Text(
                  dwonloadData[2],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 3.7),
                ),
                subtitle: Text(
                  dwonloadData[3],
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    await deleteDownloads(snapshot.data[i]);
                    setState(() {});
                  },
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => WillPopScope(
                            onWillPop: () async {
                              _meeduPlayerController.pause();
                              return true;
                            },
                            child: AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              content: Container(
                                height: SizeConfig.safeBlockVertical * 25,
                                width: SizeConfig.screenWidth,
                                // padding: EdgeInsets.symmetric(vertical: 200),
                                child: ExerciseVideo(
                                  controller: _meeduPlayerController,
                                  isLoacalVideo: true,
                                  videoUrl: snapshot.data[i],
                                ),
                              ),
                            ),
                          ));
                },
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * .25,
                  horizontal: SizeConfig.safeBlockHorizontal * 3,
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        });
  }
}
