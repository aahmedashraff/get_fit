import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class SmallVerticalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 4,
      width: SizeConfig.safeBlockHorizontal * 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal),
      ),
    );
  }
}
