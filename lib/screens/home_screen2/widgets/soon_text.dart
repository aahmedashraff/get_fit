import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class SoonText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          text: "Soon ",
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
          children: [
            TextSpan(
              text: "Premium ",
              style: TextStyle(
                color: Colors.green,
                fontSize: SizeConfig.safeBlockHorizontal * 5,
              ),
            ),
            TextSpan(
              text: "Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 5,
              ),
            ),
          ],
        ),
      ),
      alignment: Alignment.center,
      margin:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal),
        gradient: LinearGradient(
          colors: [
            Color(0xFF77382C),
            Theme.of(context).primaryColor,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(.5),
                 blurRadius: 4,
                // spreadRadius: 0,
                offset: Offset(0, SizeConfig.safeBlockVertical * .25),
        )]
      ),
    );
  }
}
