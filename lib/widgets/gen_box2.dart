import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
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
              Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/fetria.png',
                      height: SizeConfig.safeBlockVertical * 18,
                      fit: BoxFit.fill,
                      color: (male && userData.userGender == "Male") ||
                              (!male && userData.userGender != "Male")
                          ? null
                          : Colors.grey,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/young-woman.png',
                      height: SizeConfig.safeBlockVertical * 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
