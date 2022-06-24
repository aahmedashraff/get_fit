import 'package:flutter/material.dart';

class Dimensions {
  static double screenWidth;
  static double screenHeight;
  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  static double ratioFromWidth({
   
    @required int pixels
  }) {
    return double.parse((screenWidth* (pixels / 392.73)).toStringAsFixed(2));
  }

  static double ratioFromHeight({@required int pixels}) {
    return double.parse((screenHeight * (pixels / 850.91)).toStringAsFixed(2));
  }
}
