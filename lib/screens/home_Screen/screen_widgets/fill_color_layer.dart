import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class FillColorLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
        ),
       // margin: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical),
      ),
    );
  }
}
