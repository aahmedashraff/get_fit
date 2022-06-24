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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/maletria.png',
                        height: SizeConfig.safeBlockVertical * 18,
                        fit: BoxFit.fill,
                        color: (male && userData.userGender == "Male") ||
                                (!male && userData.userGender != "Male")
                            ? primaryColor
                            : Colors.grey.shade500,
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/male.svg',
                        height: SizeConfig.safeBlockVertical * 10,
                        fit: BoxFit.cover,
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
