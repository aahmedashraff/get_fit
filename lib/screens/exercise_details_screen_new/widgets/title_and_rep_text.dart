import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TitleRepText extends StatelessWidget {
  final String repetitionText;
  final bool hasDuration;
  final String exerciseName;
  TitleRepText({this.repetitionText, this.hasDuration, this.exerciseName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 1.75,
        left: SizeConfig.safeBlockHorizontal * 4,
        right: SizeConfig.safeBlockHorizontal * 4,
        bottom: SizeConfig.safeBlockVertical * 1.5,
      ),
      child: Row(
        children: [
           Text(
            exerciseName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 4,
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: repetitionText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: hasDuration ? " Sec" : " Reps",
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ),
         
        ],
      ),
    );
  }
}
