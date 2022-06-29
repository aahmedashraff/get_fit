import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

enum BoxSelect { muscle, skills, lose, strength, run }

List goaliconss = [
  SvgPicture.asset('assets/images/muscle.svg'),
  SvgPicture.asset('assets/images/skills.svg'),
  SvgPicture.asset('assets/images/fat.svg'),
  SvgPicture.asset('assets/images/dumble.svg'),
  SvgPicture.asset('assets/images/running.svg'),
];

class RadioButtonContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFromLevelScreen;
  final String assetName;
  final Widget svg = SvgPicture.asset('assetName', semanticsLabel: 'Acme Logo');
  RadioButtonContainer({
    this.subtitle,
    @required this.title,
    this.isFromLevelScreen,
    BoxSelect SelectedBox,
    this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    return GestureDetector(
      onTap: () {
        isFromLevelScreen
            ? userData.selectUserLevel(title)
            : userData.selectUserGoal(title);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Stack(
          children: [
            Container(
              height: 70,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: check(userData)
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 2,
                  ),
                  SvgPicture.asset(
                    'assets/images/check.svg',
                    color: check(userData)
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 4,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: check(userData) ? Colors.white : Colors.grey,
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    assetName,
                    height: 48,
                    // width: 57,
                    color: check(userData)
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool check(UserData userData) {
    if (isFromLevelScreen) {
      return userData.getUserLevel == title;
    }
    return userData.getUserGoal == title;
  }
}
