import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../theme/theme_constant.dart';

class CreateGenderBox extends StatelessWidget {
  const CreateGenderBox({
    Key key,
    @required this.male,
  }) : super(key: key);

  final bool male;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    SizeConfig().init(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          (male && userData.userGender == "Male") ||
                  (!male && userData.userGender != "Male")
              ? null
              : userData.selectGender();
        },
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/maletria.png',
                          height: 180,
                          fit: BoxFit.fill,
                          color: (male && userData.userGender == "Male") ||
                                  (!male && userData.userGender != "Male")
                              ? primaryColor
                              : Colors.grey.shade500,
                        ),
                      ],
                    ),
                    Positioned(
                      left: 68,
                      right: 70,
                      top: 82,
                      bottom: 25,
                      child: SvgPicture.asset(
                        'assets/images/male.svg',
                      ),
                    ),
                  ],
                ),
              ),

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
