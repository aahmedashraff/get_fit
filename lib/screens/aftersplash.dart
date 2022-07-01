import 'package:CaptainSayedApp/login_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/gender_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../sizeConfig.dart';
import '../theme/theme_constant.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              children: [
                Expanded(
                  child: isDark
                      ? Image.asset(
                          'assets/images/logohead2dark.png',
                        )
                      : Image.asset(
                          'assets/images/logohead2light.png',
                        ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 10),
                Text(
                  'Power in Your Hands',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(1.0),
                        // offset: Offset(0.0, 0.0),
                      ),
                    ],
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: Text(
                    'With the Get Fit application it will be between you have a destructive power to build your body with',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 11.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 7,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 95.w,
                    height: SizeConfig.safeBlockVertical * 8,
                    child: ElevatedButton(
                      child: Text(
                        'start now',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(GenderScreen.screenName),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          primaryColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I already have an account '),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(LoginScreen.screenName),
                      child: Text(
                        ' login',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
