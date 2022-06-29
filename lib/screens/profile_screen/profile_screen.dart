import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/user_photo.dart';
import 'package:CaptainSayedApp/screens/profile_screen/workout/prev_screen.dart';
import 'package:CaptainSayedApp/screens/settings_screen/settings_screen.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/user_info_listTile_item.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_data.dart';
import '../contact_us_screen/widgets/screen_head.dart';
import '../premium_acc_screen/premium_acc_screen.dart';
import '../settings_screen/widget_of_screen/top_of_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const screenName = "/profile-screen";
  @override
  Widget build(BuildContext context) {
    final birthdate = Provider.of<UserData>(context).userBithDate;

    final age = DateTime.now().year - int.parse(birthdate.substring(0, 4));
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            TopOfScreen(
              lable: 'Profile',
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                    border: Border.all(
                      color: isDark ? Colors.transparent : Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 397,
                  height: 136,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              UserPhot(true),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 55),
                                    child: Row(
                                      children: [
                                        Consumer<UserData>(
                                          builder: (_, data, ch) => Text(
                                            'Ahmed Ashraf',
                                            style: TextStyle(
                                                fontSize: 20,
                                                overflow: TextOverflow.fade,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Image.asset(
                                            'assets/images/check (3).png'),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 22),
                                    child: Consumer<UserData>(
                                      builder: (_, data, ch) => Text(
                                        data.userEmail,
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 160, top: 3),
                                    child: Consumer<UserData>(
                                      builder: (_, data, ch) => Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color:
                                                primaryColor.withOpacity(.3)),
                                        child: Text(
                                          data.getUserLevel,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: primaryColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                border: Border.all(
                  color: isDark ? Colors.transparent : Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 397,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'My Privileges',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal * 17),
                        Image.asset('assets/images/dumblee.png'),
                        Padding(
                          padding: const EdgeInsets.only(left: 145, top: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PrevScreen(),
                                ),
                              );
                            },
                            child: Image.asset('assets/images/down-arrow.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/dum.png'),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                        Image.asset('assets/images/dum2.png'),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                        Image.asset('assets/images/mus2.png'),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                        Image.asset('assets/images/gym2.png'),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                        Image.asset('assets/images/lift.png'),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                        Image.asset('assets/images/wmn.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PremiumAccScreen(),
                      ),
                    );
                  },
                  child: Image.asset('assets/images/Premium.png'),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical),
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                border: Border.all(
                  color: isDark ? Colors.transparent : Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 397,
              height: 335,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 130, top: 10),
                    child: Row(
                      children: [
                        Text('Personal Information'),
                        SizedBox(width: SizeConfig.safeBlockVertical * 10),
                        InkWell(
                            child: Image.asset('assets/images/settings.png'),
                            onTap: () => Navigator.of(context)
                                .pushNamed(SettingScreen.screenName)),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Line 15.png'),
                  UserInfoListTileItem(
                    title: 'Your Age',
                    subtitle: '$age',
                    assetName: 'assets/images/agee.png',
                  ),
                  Image.asset('assets/images/infoline.png'),
                  Consumer<UserData>(
                    builder: (_, data, ch) => UserInfoListTileItem(
                      title: 'Your Weight',
                      subtitle: data.userWeight,
                      assetName: 'assets/images/kg.png',
                    ),
                  ),
                  Image.asset('assets/images/infoline.png'),
                  Consumer<UserData>(
                    builder: (_, data, ch) => UserInfoListTileItem(
                      title: 'Your Weight',
                      subtitle: '168 CM',
                      assetName: 'assets/images/cm.png',
                    ),
                  ),
                  Image.asset('assets/images/infoline.png'),
                  UserInfoListTileItem(
                    title: 'Your Fat',
                    subtitle: ' 25%',
                    assetName: 'assets/images/profilefat.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
