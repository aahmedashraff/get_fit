import 'package:CaptainSayedApp/screens/profile_screen/person_edit_photo.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_data.dart';

class PersonalEdit extends StatelessWidget {
  static const screenName = "personal";

  const PersonalEdit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical * 5),
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 29,
                ),
                Text(
                  "Personal Edit",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            Stack(
              children: [
                PersonEditPhoto(true),
                Image.asset(
                  'assets/images/photedit.png',
                  width: SizeConfig.safeBlockHorizontal * 18.29,
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Consumer<UserData>(
              builder: (_, data, ch) => Text(
                'Ahmed Ashraf',
                style: TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
