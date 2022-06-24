import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProgramLevelIndication extends StatelessWidget {
  final int programNum;
  ProgramLevelIndication(this.programNum);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical * 2,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i < 5; i++)
              Container(
                margin: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal,
                ),
                width: SizeConfig.safeBlockHorizontal * 2,
                height: SizeConfig.safeBlockHorizontal * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: programNum == i
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
              ),
          ],
        ),
        width: SizeConfig.screenWidth,
      ),
    );
  }
}
