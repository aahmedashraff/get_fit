import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../login_screen.dart';
import '../../sizeConfig.dart';
import '../../widgets/next_or_submit_button.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key key}) : super(key: key);
  static const screenName = "congratulations";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/Logo.svg'),
              ],
            ),
            Positioned(
              right: 50,
              top: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulation',
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Account created successfully',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ' We will redirect you to the login page to',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '  Confirm The Account',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(LoginScreen.screenName),
                  child: NextOrSubmitButton("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
