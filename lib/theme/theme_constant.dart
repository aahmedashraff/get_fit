import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(254, 149, 42, 1);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'poppins',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'poppins',
    scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(),
  );
}
