import 'package:CaptainSayedApp/screens/aftersplash.dart';
import 'package:CaptainSayedApp/screens/profile_screen/account_data_edit.dart';
import 'package:CaptainSayedApp/screens/profile_screen/personal_edit.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/social_account_item.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/top_of_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class SettingScreen extends StatefulWidget {
  static const screenName = "/setting-screen";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notifyStatus = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopOfScreen(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Text(
                      'General Information',
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                    border: Border.all(
                      color: isDark ? Colors.transparent : Colors.grey.shade50,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 397,
                  height: 170,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/perdata.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Personal Data'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 170),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PersonalEdit(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/down-arrow.png',
                                color:
                                    isDark ? Colors.grey.shade50 : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 3),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/data.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Account Data'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 170),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(AccountDataEdit.screenName),
                              child: Image.asset(
                                'assets/images/down-arrow.png',
                                color:
                                    isDark ? Colors.grey.shade50 : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Text(
                      'Subscription',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                    border: Border.all(
                      color: isDark ? Colors.transparent : Colors.grey.shade50,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 397,
                  height: 170,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/premiconset.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Premium Subscription'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 112),
                            child: Image.asset(
                              'assets/images/down-arrow.png',
                              color:
                                  isDark ? Colors.grey.shade50 : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 3),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/change.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Change your exercise'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 115),
                            child: Image.asset(
                              'assets/images/down-arrow.png',
                              color:
                                  isDark ? Colors.grey.shade50 : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Text(
                      'Settings',
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                    border: Border.all(
                      color: isDark ? Colors.transparent : Colors.grey.shade50,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 397,
                  height: 673,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/lan.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Language'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 190),
                            child: Image.asset(
                              'assets/images/down-arrow.png',
                              color:
                                  isDark ? Colors.grey.shade50 : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 3),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/dark.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Dark Mode'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 140),
                            child: Consumer<ThemeManager>(
                              builder: (context, notifier, child) =>
                                  FlutterSwitch(
                                      toggleSize: 25,
                                      height:
                                          SizeConfig.safeBlockVertical * 3.4,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 15.5,
                                      value: notifier.darkTheme,
                                      onToggle: (val) {
                                        notifier.toggleTheme();
                                      }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/rate.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Rate The App'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 165),
                            child: Image.asset(
                              'assets/images/down-arrow.png',
                              color:
                                  isDark ? Colors.grey.shade50 : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/support.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Support'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 199),
                            child: Image.asset(
                              'assets/images/down-arrow.png',
                              color:
                                  isDark ? Colors.grey.shade50 : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/bell.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Notification'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 130),
                            child: FlutterSwitch(
                              toggleSize: 25,
                              height: SizeConfig.safeBlockVertical * 3.4,
                              width: SizeConfig.safeBlockHorizontal * 15.5,
                              value: _notifyStatus,
                              onToggle: (val) {
                                setState(() {
                                  _notifyStatus = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: InkWell(
                                onTap: () async {
                                  try {
                                    await Provider.of<Auth>(context,
                                            listen: false)
                                        .signOut(context: context);
                                    print("410");
                                  } on Exception {
                                    return;
                                  }
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (_) => AfterSplash()),
                                      (_) => false);
                                },
                                child: Image.asset('assets/images/logout.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Logout'),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      Image.asset('assets/images/div.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Image.asset('assets/images/follow.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 30),
                            child: Text('Follow Us'),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialAccountItem(title: 'face'),
                          SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                          Image.asset('assets/images/socline.png'),
                          SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                          SocialAccountItem(title: 'insta'),
                          SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                          Image.asset('assets/images/socline.png'),
                          SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                          SocialAccountItem(title: 'yout'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //backgroundColor: Color(0xFFE9E9E9)
    );
  }
}
