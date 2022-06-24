import 'package:CaptainSayedApp/screens/sign_up_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                "your goal",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 18,
              child: SvgPicture.asset('assets/images/Component 4 – 1.svg'),
            ),
            Text(
              'What is your target goal?',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockVertical * 2,
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Spacer(flex: 6),
            RadioButtonContainer(
              title: titles[0],
              isFromLevelScreen: false,
              assetName: 'assets/images/muscle.svg',
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical / 2,
            ),
            Spacer(flex: 6),
            RadioButtonContainer(
              title: titles[1],
              isFromLevelScreen: false,
              assetName: 'assets/images/swim.svg',
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical / 2,
            ),
            Spacer(flex: 6),
            RadioButtonContainer(
              title: titles[2],
              isFromLevelScreen: false,
              assetName: 'assets/images/fat.svg',
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical / 2,
            ),
            Spacer(flex: 6),
            RadioButtonContainer(
              title: titles[3],
              isFromLevelScreen: false,
              assetName: 'assets/images/dumble.svg',
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical / 2,
            ),
            Spacer(flex: 6),
            RadioButtonContainer(
              title: titles[4],
              isFromLevelScreen: false,
              assetName: 'assets/images/run.svg',
            ),
            Spacer(flex: 5),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SignUpScreen.screenName),
              child: NextOrSubmitButton("Next"),
            )
          ],
        ),
      ),
    );
  }
}
