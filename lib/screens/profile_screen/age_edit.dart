import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';
import '../../widgets/next_or_submit_button.dart';
import '../before_signup_screens/height_screen.dart';
import 'edit_save_btn.dart';

class AgeEditScreen extends StatefulWidget {
  static const screenName = "/old-screen";

  @override
  _AgeEditScreenState createState() => _AgeEditScreenState();
}

class _AgeEditScreenState extends State<AgeEditScreen> {
  int currentAgeValue = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Age",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
                      Text(
                        "Looks Like We're Getting Old :)",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 8,
            ),
            NumberPicker(
              itemCount: 6,
              itemHeight: SizeConfig.safeBlockVertical * 6,
              itemWidth: 400,
              haptics: true,
              minValue: 0,
              maxValue: 70,
              textStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
              selectedTextStyle: TextStyle(
                color: primaryColor,
                fontSize: 40,
              ),
              value: currentAgeValue,
              onChanged: (value) => setState(() => currentAgeValue = value),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: EditSaveButton("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
