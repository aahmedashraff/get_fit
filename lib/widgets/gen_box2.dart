import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CreateGenderBoxxx extends StatelessWidget {
  const CreateGenderBoxxx({
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
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/fetria.png',
                      height: 180,
                      fit: BoxFit.contain,
                      color: (male && userData.userGender == "Male") ||
                              (!male && userData.userGender != "Male")
                          ? null
                          : Colors.grey,
                    ),
                    Positioned(
                      left: 17,
                      right: 17,
                      top: 10,
                      child: SvgPicture.asset(
                        'assets/images/female.svg',
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
