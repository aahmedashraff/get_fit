import 'dart:io';

import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class CreateBeforeAfter extends StatefulWidget {
  final bool isBeforeImage;
  final void Function(File image) fun;

  const CreateBeforeAfter({this.isBeforeImage, this.fun});
  @override
  _CreateBeforeAfterState createState() => _CreateBeforeAfterState();
}

class _CreateBeforeAfterState extends State<CreateBeforeAfter> {
  File _selectedImage;
  Future<void> getImageFromUser() async {
    final image = await ImagePicker().getImage(
      source: ImageSource.gallery,maxWidth: 600
    );
    if (image == null) return;
    widget.fun(File(image.path));
    if(mounted)
    setState(() {
      _selectedImage = File(image.path);
    });
    final appDir = await getApplicationDocumentsDirectory();
    final imagePath = path.basename(image.path);
    final imageToBeSaved =
        await File(image.path).copy('${appDir.path}/$imagePath');
  }

  @override
  Widget build(BuildContext context) {
    var text = widget.isBeforeImage ? "Before" : "After";
    return Container(
      //height: SizeConfig.safeBlockVertical * 35,
      //decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  if (_selectedImage == null)
                    Icon(
                      AppIcon.upload1,
                      color: Colors.black,
                    ),
                  if (_selectedImage == null) Text("Upload $text Photo"),
                  if (_selectedImage != null)
                    ClipRRect(
                      child: Image.file(
                        _selectedImage,
                        height: SizeConfig.safeBlockVertical * 35,
                        width: SizeConfig.safeBlockHorizontal * 45,
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 2,
                      ),
                    ),
                  if (_selectedImage != null)
                    Text(
                      text,
                      style: TextStyle(color: Colors.black),
                    )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              width: SizeConfig.safeBlockHorizontal * 45,
              constraints:
                  BoxConstraints(minHeight: SizeConfig.safeBlockVertical * 35),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.5),
                      blurRadius: 4,
                      offset: Offset(0, SizeConfig.safeBlockVertical * .25),
                    )
                  ]),
            ),
            onTap: () => _selectedImage == null ? getImageFromUser() : null,
          ),
          if (_selectedImage != null)
            SizedBox(height: SizeConfig.safeBlockVertical),
          if (_selectedImage != null)
            InkWell(
              child: Container(
                child: FittedBox(child: Text("Change Photo")),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal,
                ),
                height: SizeConfig.safeBlockVertical * 3,
                width: SizeConfig.blockSizeHorizontal * 25,
              ),
              onTap: () => getImageFromUser(),
            )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
