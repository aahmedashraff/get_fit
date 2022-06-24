import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class RepetitionText extends StatelessWidget {
  final String repetitionText;
  RepetitionText(this.repetitionText);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        //text: repetitionText.substring(0, repetitionText.indexOf("/")),
        text: repetitionText,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.safeBlockHorizontal * 5.5,
        ),
        children: [
          TextSpan(
           // text: repetitionText.substring(repetitionText.indexOf("/")),
           text: " Reps",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: SizeConfig.safeBlockHorizontal * 4,
            ),
          ),
        ],
      ),
    );
  }
}
