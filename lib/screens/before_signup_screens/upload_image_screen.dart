import 'dart:io';

import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/level_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class UploadImageScreen extends StatefulWidget {
  static const screenName = "/upload-image-screen";

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen>
    with TickerProviderStateMixin {
  File _currentlySelectedImage;

  var _isNextClicked = false;

  AnimationController _controller;
  Animation<Offset> _animation;
  // var startOffset = Offset(0, 0);
  // var endOffset = Offset(0, 50);
  // var rightEndOffset = Offset(0, 50);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation =
        Tween(begin: Offset(0, 0), end: Offset(20, 0)).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() {
          //startOffset = -Offset(0, 300);
          _animation = Tween(begin: Offset(20, 0), end: Offset(-20, 0))
              .animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ));
        });
        await _controller.reverse();
        setState(() {
          _animation = Tween(begin: Offset(-20, 0), end: Offset(0, 0))
              .animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ));
        });
        await _controller.forward();
        setState(() {
          _animation = Tween(begin: Offset(0, 0), end: Offset(20, 0))
              .animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ));
        });
        _controller.reset();
      }
    });
  }

  Future<void> _startAnimation() async {
    if (!_isNextClicked) {
      setState(() {
        _isNextClicked = true;
      });
    }
    await _controller.forward();
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 3),
        Text(
          "Photo",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(fontSize: SizeConfig.safeBlockVertical * 5),
        ),
        Spacer(flex: 9),
        GestureDetector(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, ch) => Transform.translate(
              offset: _animation == null ? Offset(0, 0) : _animation.value,
              child: ch,
            ),
            child: CircleAvatar(
              child: _currentlySelectedImage != null
                  ? null
                  : Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                      size: SizeConfig.safeBlockVertical * 7,
                    ),
              backgroundImage: _currentlySelectedImage != null
                  ? FileImage(_currentlySelectedImage)
                  : null,
              backgroundColor: Colors.white,
              radius: SizeConfig.safeBlockVertical * 8.5,
            ),
          ),
          onTap: _getUserPicture,
        ),
        Container(
          alignment: Alignment.center,
          child: _isNextClicked && _currentlySelectedImage == null
              ? FittedBox(
                  child: const Text(
                    "Please upload your photo",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : null,
          height: SizeConfig.safeBlockVertical * 6,
        ),
        Spacer(flex: 3),
        Text(
          "Upload your Photo",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(fontSize: SizeConfig.safeBlockVertical * 3),
        ),
        Spacer(flex: 9),
        NextOrSubmitButton(
          "Next",
          onPress: () => _currentlySelectedImage == null
              ? _startAnimation()
              : Navigator.of(context).pushNamed(LevelScreen.screenName),
        )
      ],
    );
  }

  Future<void> _getUserPicture() async {
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
    Provider.of<UserData>(context, listen: false)
        .setImgePath(imageToBeSaved.path);
  }
}
