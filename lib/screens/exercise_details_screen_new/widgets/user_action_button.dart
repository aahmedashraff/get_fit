import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserActionButtons extends StatefulWidget {
  final String videoUrl;
  final String exerciseTitle;
  final String exerciseInfo;
  final int exerciseId;
  final String programId;
  final bool isFromProgram;
  final String img;
  UserActionButtons(
      {this.exerciseId,
      this.programId,
      this.exerciseInfo,
      this.exerciseTitle,
      this.isFromProgram,
      this.img,
      this.videoUrl});

  @override
  _UserActionButtonsState createState() => _UserActionButtonsState();
}

class _UserActionButtonsState extends State<UserActionButtons> {
  var _isFavLoading = false;
  var _isSaveLoading = false;
  var _isDownloading = false;
  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserData>(context, listen: false).userToken;
    return WillPopScope(
      onWillPop: () async {
        if (_isFavLoading) return false;
        return true;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isFavLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FlatButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.black,
                      ),
                      Text("Favourite")
                    ],
                  ),
                  onPressed: () async {
                    setState(() {
                      _isFavLoading = true;
                    });
                    try {
                      await addToFavourite(
                        exerciseId: widget.exerciseId,
                        token: token,
                      );
                      showDialogMessage(
                        context: context,
                        message: "Exercise was added successfully.",
                        title: "Done",
                      );
                    } catch (e) {
                      showDialogMessage(
                        context: context,
                        message: e.toString().contains("already exist")
                            ? e.toString()
                            : "Exercise was added before.",
                        title: "Error",
                      );
                    }
                    setState(() {
                      _isFavLoading = false;
                    });
                  },
                ),
          _isSaveLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FlatButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                      Text("Save")
                    ],
                  ),

                  //label: Text("Favourite"),
                  onPressed: () async {
                    if (!widget.isFromProgram) return;
                    setState(() {
                      _isSaveLoading = true;
                    });
                    print(widget.programId);
                    print("jjjjjjjjjj");
                    try {
                      await addToSaves(
                        exersiceId: widget.exerciseId.toString(),
                        token: token,
                      );
                      showDialogMessage(
                        context: context,
                        message: "Exercise was added successfully.",
                        title: "Done",
                      );
                    } catch (e) {
                      showDialogMessage(
                        context: context,
                        message: e.toString().contains("already exist")
                            ? e.toString()
                            : "Exercise was added before.",
                        title: "Error",
                      );
                    }
                    setState(() {
                      _isSaveLoading = false;
                    });
                  },
                ),
          FlatButton(
            child: Column(
              children: [
                Icon(
                  AppIcon.cloud_computing,
                  color: Colors.black,
                ),
                Text("Download")
              ],
            ),

            //label: Text("Favourite"),
            onPressed: _isDownloading
                ? () {}
                : () async {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("The video is downloading"),
                      duration: Duration(seconds: 3),
                    ));
                    setState(() {
                      _isDownloading = true;
                    });
                    await download(
                      url: widget.videoUrl,
                      exerciseId: widget.exerciseId.toString(),
                      exerciseInfo: widget.exerciseInfo,
                      exerciseTitle: widget.exerciseTitle,
                      imageUrl: widget.img,
                    );
                    if (mounted) {
                      setState(() {
                        _isDownloading = false;
                      });
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("The video is downloaded Successfully"),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  },
          ),
        ],
      ),
    );
  }
}
