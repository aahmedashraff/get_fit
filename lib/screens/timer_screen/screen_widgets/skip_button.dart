import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final Function onPress;
  SkipButton(this.onPress);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed:  onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 1.5,
          horizontal: SizeConfig.safeBlockHorizontal * 12,
        ),
        child: Text(
          "Skip Rest",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
          ),
        ),
      ),
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
      ),
    );
  }
}
