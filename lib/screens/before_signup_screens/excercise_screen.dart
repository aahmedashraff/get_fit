import 'package:CaptainSayedApp/screens/before_signup_screens/goals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';
import '../../widgets/next_or_submit_button.dart';
import '../../widgets/reusable_card.dart';

enum BoxSelect {
  gym,
  home,
}

class ExercisePlaceScreen extends StatefulWidget {
  static const screenName = "/exerciseplace-screen";

  const ExercisePlaceScreen({Key key}) : super(key: key);

  @override
  State<ExercisePlaceScreen> createState() => _ExercisePlaceScreenState();
}

class _ExercisePlaceScreenState extends State<ExercisePlaceScreen> {
  BoxSelect SelectedBox;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Sizer(
      builder: (context, orientation, deviceType) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 6.5.h,
                  ),
                  Text(
                    "Exercise",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: isDark
                        ? Image.asset('assets/images/exerciseindidark.png')
                        : SvgPicture.asset('assets/images/excersizeindi.svg'),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "where do you exercise?",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 23.h,
                        width: 46.w,
                        child: GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                SelectedBox = BoxSelect.gym;
                              },
                            );
                          },
                          child: ReusableCard(
                            colour: SelectedBox == BoxSelect.home
                                ? primaryColor
                                : Colors.grey.shade500,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check.svg',
                                        height: 3.h,
                                        alignment: Alignment.topLeft,
                                        width: 26.w,
                                        color: SelectedBox == BoxSelect.gym
                                            ? primaryColor
                                            : Colors.grey.shade500,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'gym',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: SelectedBox == BoxSelect.gym
                                            ? Colors.white
                                            : Colors.grey.shade500,
                                        fontSize: 17.sp),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/gym.svg',
                                      height: 6.h,
                                      width: 57.w,
                                      color: SelectedBox == BoxSelect.gym
                                          ? primaryColor
                                          : Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            decColour: SelectedBox == BoxSelect.gym
                                ? primaryColor
                                : Colors.grey.shade500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                        width: 46.w,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              SelectedBox = BoxSelect.home;
                            });
                          },
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, left: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check.svg',
                                        height: 3.h,
                                        alignment: Alignment.topLeft,
                                        width: 26.w,
                                        color: SelectedBox == BoxSelect.home
                                            ? primaryColor
                                            : Colors.grey.shade500,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'home',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: SelectedBox == BoxSelect.home
                                            ? Colors.white
                                            : Colors.grey.shade500,
                                        fontSize: 17.sp),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/home.svg',
                                      height: 6.h,
                                      width: 57.w,
                                      color: SelectedBox == BoxSelect.home
                                          ? primaryColor
                                          : Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            decColour: SelectedBox == BoxSelect.home
                                ? primaryColor
                                : Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(GoalsScreen.screenName);
                    },
                    child: NextOrSubmitButton("Next"),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
