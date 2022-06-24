import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TextOnImage extends StatelessWidget {
  final String title;
  TextOnImage(this.title);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeConfig.safeBlockVertical * 2,
      left: SizeConfig.safeBlockHorizontal * 10,
      child: RichText(
        text: TextSpan(
          text: "$title\n",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.safeBlockHorizontal * 12,
            height: SizeConfig.blockSizeVertical / 8,
          ),
          children: [
            TextSpan(
              text: "$title exercise",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.safeBlockHorizontal * 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
