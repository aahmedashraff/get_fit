import 'package:CaptainSayedApp/screens/before_signup_screens/excercise_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/edit_save_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    "Weight",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: SvgPicture.asset('assets/images/weightindi.svg'),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 3,
                  ),
                  Text(
                    "what is your weight?",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
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
                              icon: FontAwesomeIcons.minus,
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
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 10),
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
                                  icon: FontAwesomeIcons.plus,
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
              SizedBox(
                height: SizeConfig.safeBlockVertical * 6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: EditSaveButton("Next"),
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
