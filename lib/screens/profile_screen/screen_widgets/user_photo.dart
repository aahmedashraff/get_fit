import 'dart:io';

import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../sizeConfig.dart';

class UserPhot extends StatefulWidget {
  final bool isEditable;
  UserPhot(this.isEditable);
  @override
  _UserPhotState createState() => _UserPhotState();
}

class _UserPhotState extends State<UserPhot> {
  File _currentlySelectedImage;

  Future<void> getUserPicture() async {
    final image = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxWidth: 600);
    if (image == null) return;
    setState(() {
      _currentlySelectedImage = File(image.path);
    });

    final appDir = await getApplicationDocumentsDirectory();
    final imageName = path.basename(image.path);
    final imageToBeSaved =
        await File(image.path).copy('${appDir.path}/$imageName');
    Provider.of<UserData>(context, listen: false)
        .setUserImagePath(imageToBeSaved.path);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FutureBuilder(
        future: Provider.of<UserData>(context, listen: !widget.isEditable)
            .getUserImagePath,
        builder: (_, snap) => CircleAvatar(
          backgroundColor: primaryColor,
          radius: widget.isEditable
              ? SizeConfig.safeBlockVertical * 4
              : SizeConfig.safeBlockVertical * 4,
          child: CircleAvatar(
            radius: widget.isEditable
                ? SizeConfig.safeBlockVertical * 3.7
                : SizeConfig.safeBlockVertical * 3.7,
            backgroundImage: snap.connectionState == ConnectionState.waiting
                ? null
                : (snap.data == null && _currentlySelectedImage == null
                    ? null
                    : FileImage(
                        _currentlySelectedImage != null
                            ? _currentlySelectedImage
                            : File(snap.data),
                      )),
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      onTap: widget.isEditable ? getUserPicture : null,
    );
  }
}
