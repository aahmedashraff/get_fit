import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class HomeTwoTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.safeBlockVertical,
            left: SizeConfig.safeBlockHorizontal * 4.8,
          ),
          child: Text(
            "Exercises Routine",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
          child: Text(
            "Every day an exercise",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
            ),
          ),
        )
      ],
    );
  }
}
