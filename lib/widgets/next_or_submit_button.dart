import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme_constant.dart';

//this is for the button at the end of the all first screens
class NextOrSubmitButton extends StatelessWidget {
  final String text;
  final Function onPress;
  const NextOrSubmitButton(this.text, {this.onPress});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                    fontSize: 18,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockHorizontal * 2,
                ),
                color: primaryColor,
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 2.5,
              ),
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
