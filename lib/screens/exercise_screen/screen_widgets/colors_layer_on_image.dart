import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ColorLayerOnImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal * 5,
          ),
        ),
      ),
    );
  }
}
