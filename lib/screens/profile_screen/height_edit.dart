import 'package:CaptainSayedApp/screens/before_signup_screens/weight_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/edit_save_btn.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../sizeConfig.dart';
import '../../widgets/next_or_submit_button.dart';

class HeightEditScreen extends StatefulWidget {
  static const screenName = "/height-screen";

  const HeightEditScreen({Key key}) : super(key: key);

  @override
  State<HeightEditScreen> createState() => _HeightEditScreenState();
}

class _HeightEditScreenState extends State<HeightEditScreen> {
  WeightSliderController _controller;
  double _weight = 150;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: _weight, minWeight: 130, interval: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: <Widget>[
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
                            "Your Height",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
                          Text(
                            "Let's change your height up",
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
                Container(
                  height: 90.0,
                  alignment: Alignment.center,
                  child: Text(
                    "${_weight.toStringAsFixed(0)} CM",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: VerticalWeightSlider(
                    maxWeight: 250,
                    height: 600,
                    controller: _controller,
                    onChanged: (double value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                    decoration: const PointerDecoration(
                      width: 130.0,
                      height: 3.0,
                      largeColor: Color(0xFF898989),
                      mediumColor: Color(0xFFC5C5C5),
                      smallColor: Color(0xFFF0F0F0),
                      gap: 30.0,
                    ),
                    indicator: Container(
                      height: 3.0,
                      width: 200.0,
                      alignment: Alignment.centerLeft,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 6,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: EditSaveButton("Save"),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
