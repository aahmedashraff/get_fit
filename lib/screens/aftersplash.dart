import 'package:CaptainSayedApp/login_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/gender_screen.dart';
import 'package:flutter/material.dart';

import '../sizeConfig.dart';
import '../theme/theme_constant.dart';

class AfterSplash extends StatelessWidget {
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
                  'assets/images/logohead2.png',
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 10),
              Text(
                'power in our hands',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(1.0),
                      // offset: Offset(0.0, 0.0),
                    ),
                  ],
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: Text(
                  'With the Get Fit application it will be between you have a destructive power to build your body with',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    wordSpacing: 6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400,
                  height: SizeConfig.safeBlockVertical * 8,
                  child: ElevatedButton(
                    child: Text(
                      'start now',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(GenderScreen.screenName),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I already have an account '),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(LoginScreen.screenName),
                    child: const Text(
                      ' login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
