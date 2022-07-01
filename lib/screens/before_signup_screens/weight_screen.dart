import 'package:CaptainSayedApp/screens/before_signup_screens/excercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';
import '../../widgets/next_or_submit_button.dart';
import '../../widgets/round_icon_button.dart';

class WeightScreen extends StatefulWidget {
  static const screenName = "/weight-screen";

  const WeightScreen({Key key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 6.5.h,
                    ),
                    Text(
                      "Weight",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: isDark
                          ? Image.asset('assets/images/weightindidark.png')
                          : SvgPicture.asset('assets/images/weightindi.svg'),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "what is your weight?",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 190),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  valueIndicatorColor: primaryColor,
                                  valueIndicatorTextStyle:
                                      TextStyle(fontSize: 20),
                                  valueIndicatorShape:
                                      PaddleSliderValueIndicatorShape(),
                                  showValueIndicator: ShowValueIndicator.always,
                                  thumbColor: primaryColor,
                                  activeTrackColor: primaryColor,
                                  trackHeight: 5,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 10.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 10),
                                ),
                                child: SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 70,
                                  child: Slider(
                                    label: '$weight KG',
                                    value: weight.toDouble(),
                                    min: 40,
                                    max: 250,
                                    onChanged: (double newValue) {
                                      setState(
                                        () {
                                          weight = newValue.round();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RoundIconButton(
                                    icon: Icons.minimize_sharp,
                                    onPressed: () {
                                      setState(
                                        () {
                                          weight++;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
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
                        Navigator.of(context)
                            .pushNamed(ExercisePlaceScreen.screenName);
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
          ),
        );
      },
    );
  }
}
