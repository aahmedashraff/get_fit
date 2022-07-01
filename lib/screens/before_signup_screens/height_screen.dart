import 'package:CaptainSayedApp/screens/before_signup_screens/weight_screen.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
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
                      "Height",
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
                          ? Image.asset('assets/images/heightindidark.png')
                          : SvgPicture.asset('assets/images/heightindi.svg'),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "what is your height?",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    Container(
                      height: 90.sp,
                      alignment: Alignment.center,
                      child: Text(
                        "${_weight.toStringAsFixed(0)} CM",
                        style: TextStyle(
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: VerticalWeightSlider(
                        maxWeight: 250,
                        height: 300.sp,
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
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(WeightScreen.screenName),
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
