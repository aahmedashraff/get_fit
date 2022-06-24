import 'package:CaptainSayedApp/screens/before_signup_screens/goals_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/radio_button_container.dart';

class LevelScreen extends StatelessWidget {
  static const screenName = "/level-screen";
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(flex: 2),
        Text(
          "Level",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(fontSize: SizeConfig.safeBlockVertical * 5),
        ),
        Spacer(flex: 2),
        RadioButtonContainer(
          subtitle: "I've never trained before",
          title: "Newbie",
          isFromLevelScreen: true,
        ),
        Spacer(),
        RadioButtonContainer(
          subtitle: "Just start exercising",
          title: "Beginner",
          isFromLevelScreen: true,
        ),
        Spacer(),
        RadioButtonContainer(
          subtitle: "More than 3 times a week",
          title: "Intermediate",
          isFromLevelScreen: true,
        ),
        Spacer(),
        RadioButtonContainer(
          subtitle: "More than 4 times a week",
          title: "Advanced",
          isFromLevelScreen: true,
        ),
        Spacer(flex: 2),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(GoalsScreen.screenName),
          child: NextOrSubmitButton("Next"),
        ),
      ],
    );
  }
}
