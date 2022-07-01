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
import 'package:sizer/sizer.dart';

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

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopOfScreen(
                    lable: 'Settings',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.h, left: 5.w),
                        child: Text(
                          'General Information',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color: isDark ? Colors.black12 : Colors.grey.shade50,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 95.w,
                      height: 19.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/perdata.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Personal Data'),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.h, left: 42.w),
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
                                        color: isDark
                                            ? Colors.grey.shade50
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/data.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Account Data'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, left: 42.w),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AccountDataEdit.screenName),
                                  child: Image.asset(
                                    'assets/images/down-arrow.png',
                                    color: isDark
                                        ? Colors.grey.shade50
                                        : Colors.black,
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
                        padding: EdgeInsets.only(left: 5.w, top: 3.h),
                        child: Text(
                          'Subscription',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color:
                              isDark ? Colors.transparent : Colors.grey.shade50,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 95.w,
                      height: 19.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset(
                                    'assets/images/premiconset.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Premium Subscription'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, left: 27.w),
                                child: Image.asset(
                                  'assets/images/down-arrow.png',
                                  color: isDark
                                      ? Colors.grey.shade50
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/change.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 4.h),
                                child: Text('Change your exercise'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, left: 28.w),
                                child: Image.asset(
                                  'assets/images/down-arrow.png',
                                  color: isDark
                                      ? Colors.grey.shade50
                                      : Colors.black,
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
                        padding: EdgeInsets.only(top: 3.h, left: 5.w),
                        child: const Text(
                          'Settings',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color:
                              isDark ? Colors.transparent : Colors.grey.shade50,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 95.w,
                      height: 71.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/lan.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Language'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, left: 50.w),
                                child: Image.asset(
                                  'assets/images/down-arrow.png',
                                  color: isDark
                                      ? Colors.grey.shade50
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 3),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/dark.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Dark Mode'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 35.w, top: 3.h),
                                child: Consumer<ThemeManager>(
                                  builder: (context, notifier, child) =>
                                      FlutterSwitch(
                                    toggleSize: 25,
                                    height: SizeConfig.safeBlockVertical * 3.4,
                                    width:
                                        SizeConfig.safeBlockHorizontal * 15.5,
                                    value: notifier.darkTheme,
                                    onToggle: (val) {
                                      notifier.toggleTheme();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/rate.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 4.h),
                                child: Text('Rate The App'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, left: 44.w),
                                child: Image.asset(
                                  'assets/images/down-arrow.png',
                                  color: isDark
                                      ? Colors.grey.shade50
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/support.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Support'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h, left: 53.w),
                                child: Image.asset(
                                  'assets/images/down-arrow.png',
                                  color: isDark
                                      ? Colors.grey.shade50
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/bell.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Notification'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 35.w, top: 3.h),
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
                          SizedBox(height: 2.h),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
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
                                    child: Image.asset(
                                        'assets/images/logout.png')),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Logout'),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2),
                          Image.asset(
                            'assets/images/div.png',
                            color: isDark ? Colors.grey.shade50 : Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, top: 1.h),
                                child: Image.asset('assets/images/follow.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 3.h),
                                child: Text('Follow Us'),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialAccountItem(title: 'face'),
                              SizedBox(width: 4.w),
                              Image.asset('assets/images/socline.png'),
                              SizedBox(width: 4.w),
                              SocialAccountItem(title: 'insta'),
                              SizedBox(width: 4.w),
                              Image.asset('assets/images/socline.png'),
                              SizedBox(width: 4.w),
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
      },
    );
  }
}
