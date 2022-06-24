import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class CompleteExerciseButton extends StatelessWidget {
  final Function onpress;
  CompleteExerciseButton(this.onpress);
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomCenter,
          child: RaisedButton(
        onPressed: onpress,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 16,
            vertical: SizeConfig.safeBlockVertical * 1.5,
          ),
          child: FittedBox(
                      child: Text(
              "Complete Exercise",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockSizeHorizontal * 4,
              ),
            ),
          ),
        ),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
        ),
      ),
    );
  }
}
