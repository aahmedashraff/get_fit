import 'dart:io';

import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../sizeConfig.dart';

class PersonEditPhoto extends StatefulWidget {
  final bool isEditable;

  PersonEditPhoto(this.isEditable);
  @override
  _PersonEditPhoto createState() => _PersonEditPhoto();
}

class _PersonEditPhoto extends State<PersonEditPhoto> {
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
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          child: FutureBuilder(
            future: Provider.of<UserData>(context, listen: !widget.isEditable)
                .getUserImagePath,
            builder: (_, snap) => Stack(children: [
              CircleAvatar(
                radius: SizeConfig.safeBlockVertical * 4.68,
                backgroundImage: snap.connectionState == ConnectionState.waiting
                    ? null
                    : (snap.data == null && _currentlySelectedImage == null
                        ? null
                        : FileImage(
                            _currentlySelectedImage != null
                                ? _currentlySelectedImage
                                : File(snap.data),
                          )),
                backgroundColor: Colors.grey.shade800,
              ),
              CircleAvatar(
                radius: SizeConfig.safeBlockVertical * 4.68,
                backgroundColor: Colors.grey.shade800.withOpacity(0.5),
              ),
              Positioned(
                left: 7.w,
                bottom: SizeConfig.safeBlockVertical * 3.5,
                child: Image.asset('assets/images/camera.png'),
              )
            ]),
          ),
          onTap: widget.isEditable ? getUserPicture : null,
        );
      },
    );
  }
}
