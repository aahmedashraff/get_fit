import 'package:CaptainSayedApp/screens/sign_up_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/radio_button_container.dart';

class GoalsScreen extends StatelessWidget {
  final bool isFromLevelScreen;
  final String title;

  static const screenName = "/goals";
  static const titles = <String>[
    'muscle building',
    "skills",
    "weight lose",
    "strength",
    'functional movement'
  ];
  static const subtitles = <String>[
    "Get stronger and perform exercises with greater ease",
    "increase volume and difficulty to ensure muscle growth",
    "Optimized for high intensity fat burning workouts",
    "Like arm balancing and more advanced movements like Front lever and Human flag"
  ];
  static SvgPicture goalIcons;

  const GoalsScreen({Key key, this.isFromLevelScreen, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    SizeConfig().init(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 6.5.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  "Your Goal",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 1.w,
                  right: 1.w,
                ),
                height: 19.h,
                child: isDark
                    ? Image.asset('assets/images/goalindidark.png')
                    : SvgPicture.asset('assets/images/Component 4 – 1.svg'),
              ),
              Text(
                'What is your target goal?',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              RadioButtonContainer(
                title: titles[0],
                isFromLevelScreen: false,
                assetName: 'assets/images/muscle.png',
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical / 2,
              ),
              Spacer(flex: 6),
              RadioButtonContainer(
                title: titles[1],
                isFromLevelScreen: false,
                assetName: 'assets/images/skills.png',
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical / 2,
              ),
              Spacer(flex: 6),
              RadioButtonContainer(
                title: titles[2],
                isFromLevelScreen: false,
                assetName: 'assets/images/fat.png',
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical / 2,
              ),
              Spacer(flex: 6),
              RadioButtonContainer(
                title: titles[3],
                isFromLevelScreen: false,
                assetName: 'assets/images/dumble.png',
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical / 2,
              ),
              Spacer(flex: 6),
              RadioButtonContainer(
                title: titles[4],
                isFromLevelScreen: false,
                assetName: 'assets/images/run.png',
              ),
              Spacer(flex: 9),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.screenName),
                child: NextOrSubmitButton("Next"),
              ),
              SizedBox(height: 1.h),
            ],
          ),
        );
      },
    );
  }
}
