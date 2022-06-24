import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final birthdate = Provider.of<UserData>(context).userBithDate;
    final age = DateTime.now().year - int.parse(birthdate.substring(0, 4));
    return FutureBuilder(
      future: Future.wait([
        UserData.getUserFullName(),
        UserData.getUserWeight(),
        UserData.getUserWorkOut()
      ]),
      builder: (_, AsyncSnapshot<List> snapShot) => snapShot.connectionState ==
              ConnectionState.waiting
          ? CircularProgressIndicator()
          : Container(
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      snapShot.data[0] ?? "New User",
                      //"ahmed ahmed",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 4,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(flex: 3),
                      Text(
                        "Age\n$age",
                        //"Age\n25",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 1.5,
                        ),
                      ),
                      Spacer(flex: 3),
                      Text(
                        "Weight\n${snapShot.data[1]}",
                        //"weight\n66",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 1.5,
                        ),
                      ),
                      Spacer(flex: 3),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 2,
                    offset: Offset(0, SizeConfig.safeBlockVertical * .5),
                  )
                ],
              ),
              width: SizeConfig.safeBlockHorizontal * 60,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * .3,
                  horizontal: SizeConfig.safeBlockHorizontal * 3),
            ),
    );
  }
}
