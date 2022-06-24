import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';
import '../../widgets/next_or_submit_button.dart';
import 'height_screen.dart';

class OldScreen extends StatefulWidget {
  static const screenName = "/old-screen";

  @override
  _OldScreenState createState() => _OldScreenState();
}

class _OldScreenState extends State<OldScreen> {
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
            Text(
              "Old",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SvgPicture.asset('assets/images/oldindi.svg'),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 3,
            ),
            Text(
              "How old are you?",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            NumberPicker(
              itemCount: 6,
              itemHeight: SizeConfig.safeBlockVertical * 5,
              itemWidth: 400,
              haptics: true,
              minValue: 0,
              maxValue: 70,
              textStyle: TextStyle(fontSize: 20),
              selectedTextStyle: TextStyle(
                color: primaryColor,
                fontSize: 40,
              ),
              value: currentAgeValue,
              onChanged: (value) => setState(() => currentAgeValue = value),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(HeightScreen.screenName),
                    child: NextOrSubmitButton("Next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
