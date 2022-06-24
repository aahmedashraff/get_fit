import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ClosedWeekFillColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.5),
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
        ),
      ),
    );
  }
}
