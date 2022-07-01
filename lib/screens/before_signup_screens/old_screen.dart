import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sizer/sizer.dart';

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
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 6.5.h,
                ),
                Text(
                  "Old",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: isDark
                      ? Image.asset('assets/images/oldindidark.png')
                      : SvgPicture.asset('assets/images/oldindi.svg'),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "How old are you?",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                NumberPicker(
                  itemCount: 7,
                  itemHeight: 6.h,
                  itemWidth: 400.w,
                  haptics: true,
                  minValue: 0,
                  maxValue: 70,
                  textStyle: TextStyle(fontSize: 15.sp),
                  selectedTextStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 35.sp,
                  ),
                  value: currentAgeValue,
                  onChanged: (value) => setState(() => currentAgeValue = value),
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
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
