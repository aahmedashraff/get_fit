import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/gen_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/gen_box2.dart';
import '../../widgets/next_or_submit_button.dart';

class GenderScreen extends StatefulWidget {
  static const screenName = "/gender-screen";
  final bool isActive;

  const GenderScreen({Key key, this.isActive}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                "gender",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SvgPicture.asset('assets/images/genderindi.svg'),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical,
            ),
            //choose_gender_txt
            Text(
              "Choose the gender",
              style: TextStyle(
                fontSize: SizeConfig.safeBlockVertical * 2,
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical,
            ),

            CreateGenderBox(male: true),
            CreateGenderBoxxx(male: false),

            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(OldScreen.screenName),
              child: NextOrSubmitButton("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
