import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final Function onPress;

  const SkipButton({ this.onPress}) ;
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
            child: FlatButton(
              onPressed: onPress,
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 2),
                  bottomLeft:
                      Radius.circular(SizeConfig.safeBlockHorizontal * 2),
                ),
              ),
            ),
            top: MediaQuery.of(context).padding.top,
            right: 0,
          );
  }
}