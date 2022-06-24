import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final style = TextStyle(
    color: Colors.black,
    fontSize: SizeConfig.safeBlockHorizontal * 5.5,
  );
  final style2 = TextStyle(
    color: Color(0xFFEE6F57),
    fontSize: SizeConfig.safeBlockHorizontal * 5.5,
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 5),
      child: RichText(
        text: TextSpan(
          text: "Be ready for ",
          style: style,
          children: [
            TextSpan(
              text: "hard training ",
              style: style2,
            ),
            TextSpan(
              text:
                  "at the hands of a private trainer, who has great experience in physical fitness. Soon there will be a ",
              style: style,
            ),
            TextSpan(
              text: "premium ",
              style: style2,
            ),
            TextSpan(
              text:
                  "version of the application that will have many features that you will discover.",
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
