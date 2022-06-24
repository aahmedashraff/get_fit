import 'dart:io';

import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/create_before_after.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class BeforeAfterSec extends StatefulWidget {
  @override
  _BeforeAfterSecState createState() => _BeforeAfterSecState();
}

class _BeforeAfterSecState extends State<BeforeAfterSec> {
  File _beforeImage;
  File _afterImage;
  bool _isLoading = false;
  // Future<void> getImageFromUser(File currentlySelectedImage) async {
  //   final image = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (image == null) return;
  //   setState(() {
  //     currentlySelectedImage = File(image.path);
  //   });
  //   final appDir = await getApplicationDocumentsDirectory();
  //   final imagePath = path.basename(image.path);
  //   final imageToBeSaved =
  //       await File(image.path).copy('${appDir.path}/$imagePath');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Container(
            child: Text(
              "Before & After",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4,
              ),
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal * 3.5,
              bottom: SizeConfig.safeBlockVertical,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 3.5),
            child: Row(
              children: [
                CreateBeforeAfter(
                  isBeforeImage: true,
                  fun: (file) => _beforeImage = file,
                ),
                Spacer(),
                CreateBeforeAfter(
                  isBeforeImage: false,
                  fun: (file) => _afterImage = file,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : FlatButton(
                  child: const Text(
                    "Upload",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 2),
                  ),
                  onPressed: () async {
                    if (_beforeImage == null || _afterImage == null) return;
                    try {
                      if (mounted)
                        setState(() {
                          _isLoading = true;
                        });
                      await uploadBeforeAndAfter(
                        afterImage: _afterImage,
                        beforeImage: _beforeImage,
                      );
                      if (mounted)
                        setState(() {
                          _isLoading = false;
                        });
                      showDialogMessage(
                          context: context,
                          message: "Photos Uploaded!",
                          title: "Done");
                    } catch (e) {
                      if (mounted)
                        setState(() {
                          _isLoading = false;
                        });
                      showDialogMessage(
                          context: context,
                          message: "Please check your connection and try again",
                          title: "Error");
                    }
                  },
                )
        ],
      ),
    );
  }
}
