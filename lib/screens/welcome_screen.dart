import 'package:CaptainSayedApp/login_screen.dart';
import 'package:CaptainSayedApp/screens/premium_acc_screen/premium_acc_screen.dart';
import 'package:CaptainSayedApp/services/auth.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

import '../theme/theme_constant.dart';

class WelcomeScreen extends StatelessWidget {
  static const screenName = "/welcome";

  const WelcomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/logohead3.png',
                  alignment: Alignment.center,
                  height: SizeConfig.safeBlockVertical * 51,
                  // width: double.infinity,
                  // fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Text(
                'welcome to',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Text(
                'getfit app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Text(
                'Get the body of your dreams fast and simple',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  wordSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 9),
                child: createButton(
                  gmail: true,
                  facebook: false,
                  text: "login with gmail",
                  apple: false,
                  email: false,
                  context: context,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9),
                child: appleButton(
                    gmail: false,
                    email: false,
                    apple: true,
                    facebook: false,
                    text: 'login with apple',
                    context: context),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8),
                child: emailButton(
                  gmail: false,
                  facebook: false,
                  text: 'login by email',
                  context: context,
                  email: true,
                  apple: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailButton({
    @required bool gmail,
    @required bool email,
    @required bool apple,
    @required bool facebook,
    @required String text,
    @required BuildContext context,
  }) {
    return GestureDetector(
      onTap: !gmail && !facebook
          ? () => Navigator.of(context).pushNamed(LoginScreen.screenName)
          : (gmail
              ? () async {
                  try {
                    await Auth().googleSignIn(context: context);
                  } on Exception {
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PremiumAccScreen()),
                      (_) => false);
                }
              : () async {
                  try {
                    null;
                    // await Auth().facebookSignIn(context);
                  } on Exception catch (e) {
                    print(e.toString());
                    print("2.2.2.2.2.lllllllllllllllllllllllllllllllllll");
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PremiumAccScreen()),
                      (_) => false);
                }),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 9,
              ),
              // child: Image.asset(
              //   "assets/images/email.png",
              //   width: SizeConfig.safeBlockHorizontal * 8,
              //   height: SizeConfig.safeBlockHorizontal * 6,
              // ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal * 4,
          ),
          color: primaryColor,
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2.5,
          horizontal: SizeConfig.safeBlockHorizontal * 15,
        ),
        margin: EdgeInsets.only(
          right: SizeConfig.safeBlockHorizontal * 3,
        ),
      ),
    );
  }

  Widget appleButton({
    @required bool gmail,
    @required bool email,
    @required bool apple,
    @required bool facebook,
    @required String text,
    @required BuildContext context,
  }) {
    return GestureDetector(
      onTap: !gmail && !facebook
          ? () => Navigator.of(context).pushNamed(LoginScreen.screenName)
          : (gmail
              ? () async {
                  try {
                    await Auth().googleSignIn(context: context);
                  } on Exception {
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PremiumAccScreen()),
                      (_) => false);
                }
              : () async {
                  try {
                    null;
                    // await Auth().facebookSignIn(context);
                  } on Exception catch (e) {
                    print(e.toString());
                    print("2.2.2.2.2.lllllllllllllllllllllllllllllllllll");
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PremiumAccScreen()),
                      (_) => false);
                }),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 9,
              ),
              child: Image.asset(
                "assets/images/apple.png",
                width: SizeConfig.safeBlockHorizontal * 8,
                height: SizeConfig.safeBlockHorizontal * 6,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal * 4,
          ),
          color: Color.fromRGBO(59, 58, 58, 1),
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2.5,
          horizontal: SizeConfig.safeBlockHorizontal * 15,
        ),
        margin: EdgeInsets.only(
          right: SizeConfig.safeBlockHorizontal * 3,
        ),
      ),
    );
  }

  Widget createButton({
    @required bool gmail,
    @required bool email,
    @required bool apple,
    @required bool facebook,
    @required String text,
    @required BuildContext context,
  }) {
    return GestureDetector(
      onTap: !gmail && !facebook
          ? () => Navigator.of(context).pushNamed(LoginScreen.screenName)
          : (gmail
              ? () async {
                  try {
                    await Auth().googleSignIn(context: context);
                  } on Exception {
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PremiumAccScreen()),
                      (_) => false);
                }
              : () async {
                  try {
                    null;
                    // await Auth().facebookSignIn(context);
                  } on Exception catch (e) {
                    print(e.toString());
                    print("2.2.2.2.2.lllllllllllllllllllllllllllllllllll");
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PremiumAccScreen()),
                      (_) => false);
                }),
      child: Container(
        child: Row(
          mainAxisAlignment: facebook || gmail
              ? MainAxisAlignment.start
              : MainAxisAlignment.start,
          children: [
            if (gmail || facebook)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 9,
                ),
                child: Image.asset(
                  gmail
                      ? "assets/images/gmail2.png"
                      : "assets/images/apple.png",
                  width: SizeConfig.safeBlockHorizontal * 8,
                  height: SizeConfig.safeBlockHorizontal * 6,
                ),
              ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  // softWrap: true,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal * 4,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2.5,
          horizontal: SizeConfig.safeBlockHorizontal * 15,
        ),
        margin: EdgeInsets.only(
          right: SizeConfig.safeBlockHorizontal * 3,
        ),
      ),
    );
  }
}
