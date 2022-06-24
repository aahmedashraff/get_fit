import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProgramText extends StatelessWidget {
  final String programName;
  ProgramText(this.programName);
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(alignment: Alignment.center,
              child: RichText(textAlign: TextAlign.center,
          text: TextSpan(
            text: "$programName",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.safeBlockHorizontal * 9.5,
            ),
            children: [
              // TextSpan(
              //   text: programName == "Fat" ? " Burning" : " Level",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: SizeConfig.safeBlockHorizontal * 9.5,
              //     //fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
     
    );
  }
}
