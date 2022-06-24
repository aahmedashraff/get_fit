import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final Function onPress;
  StartButton(this.onPress);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: SizeConfig.safeBlockHorizontal * 10,
      bottom: SizeConfig.safeBlockVertical * 1.5,
      child: RaisedButton(
        onPressed: onPress,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 30,
            vertical: SizeConfig.safeBlockVertical * 1.5,
          ),
          child: Text(
            "Start",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 4,
            ),
          ),
        ),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
        ),
      ),
    );
  }
}
