import 'package:CaptainSayedApp/screens/profile_screen/edit_save_btn.dart';
import 'package:flutter/material.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';
import '../../widgets/next_or_submit_button.dart';
import '../../widgets/round_icon_button.dart';

class WeightEditScreen extends StatefulWidget {
  static const screenName = "/weight-screen";
  const WeightEditScreen({Key key}) : super(key: key);
  @override
  State<WeightEditScreen> createState() => _WeightEditScreenState();
}

class _WeightEditScreenState extends State<WeightEditScreen> {
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Scaffold(
        body: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      Text(
                        "Your Weight",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
                      Text(
                        "Weight gain or decrease? :)",
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
            SizedBox(height: SizeConfig.safeBlockVertical * 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RoundIconButton(
                    icon: Icons.minimize,
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    }),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorColor: primaryColor,
                    valueIndicatorTextStyle: TextStyle(fontSize: 20),
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    showValueIndicator: ShowValueIndicator.always,
                    thumbColor: primaryColor,
                    activeTrackColor: primaryColor,
                    trackHeight: 1,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
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
                      icon: Icons.add,
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
            SizedBox(height: SizeConfig.safeBlockVertical * 33),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: EditSaveButton("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
