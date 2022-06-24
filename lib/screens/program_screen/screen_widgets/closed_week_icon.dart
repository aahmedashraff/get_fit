import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ClosedWeekIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        child: Icon(
          AppIcon.lock,
          color: Colors.black,
          size:
              (SizeConfig.safeBlockHorizontal + SizeConfig.safeBlockVertical) /
                  2 *
                  40,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
