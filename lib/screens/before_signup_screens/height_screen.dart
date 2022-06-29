import 'package:CaptainSayedApp/screens/before_signup_screens/weight_screen.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../sizeConfig.dart';
import '../../widgets/next_or_submit_button.dart';

class HeightScreen extends StatefulWidget {
  static const screenName = "/height-screen";

  const HeightScreen({Key key}) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
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
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Text(
                    "Height",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: SvgPicture.asset('assets/images/heightindi.svg'),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  Text(
                    "what is your height?",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2,
                    ),
                  ),
                  Container(
                    height: 90.0,
                    alignment: Alignment.center,
                    child: Text(
                      "${_weight.toStringAsFixed(0)} CM",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
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
                    onTap: () => Navigator.of(context)
                        .pushNamed(WeightScreen.screenName),
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
