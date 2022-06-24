import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: IconButton(
        color: Theme.of(context).primaryColor,
        icon: Icon(AppIcon.back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      left: SizeConfig.safeBlockHorizontal * 7,
      top: SizeConfig.safeBlockVertical * 2,
    );
  }
}
