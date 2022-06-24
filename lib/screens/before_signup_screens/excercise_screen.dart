import 'package:CaptainSayedApp/screens/before_signup_screens/goals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

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

    return SafeArea(
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  Text(
                    "Exercise",
                    style: TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SvgPicture.asset('assets/images/excersizeindi.svg'),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 35,
                    ),
                    Text(
                      "where do you exercise?",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 194,
                          width: 181,
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
                                          height: 26,
                                          alignment: Alignment.topLeft,
                                          width: 26,
                                          color: SelectedBox == BoxSelect.gym
                                              ? primaryColor
                                              : Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      'gym',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: SelectedBox == BoxSelect.gym
                                              ? Colors.white
                                              : Colors.grey.shade500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/gym.svg',
                                        height: 50,
                                        width: 57,
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
                          height: 194,
                          width: 181,
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
                                          height: 26,
                                          alignment: Alignment.topLeft,
                                          width: 26,
                                          color: SelectedBox == BoxSelect.home
                                              ? primaryColor
                                              : Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      'home',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: SelectedBox == BoxSelect.home
                                              ? Colors.white
                                              : Colors.grey.shade500,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/home.svg',
                                        height: 50,
                                        width: 57,
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
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 6,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
