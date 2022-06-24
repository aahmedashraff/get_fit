import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final style = TextStyle(
    color: Colors.black,
    fontSize: SizeConfig.safeBlockHorizontal * 5.8,
  );
  final style2 = TextStyle(
    color: Color(0xFFEE6F57),
    fontSize: SizeConfig.safeBlockHorizontal * 6,
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 5),
      child: RichText(
        text: TextSpan(
          text: "A program that helps you get the body of your dreams through many programs that suit all categories, as well as those programs designed by ",
          style: style,
          children: [
            TextSpan(
              text: "Syed Hussein",
              style: style2,
            ),
            TextSpan(
              text:
                  ", who has more than ",
              style: style,
            ),
            TextSpan(
              text: "18 experience ",
              style: style2,
            ),
            TextSpan(
              text:
                  "in that field.",
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
