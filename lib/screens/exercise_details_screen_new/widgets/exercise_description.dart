import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String description;
  DescriptionText(this.description);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 5),
            ),
            width: SizeConfig.safeBlockHorizontal * 100,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4,
            ),
          ),
        ],
      ),
    );
  }
}
