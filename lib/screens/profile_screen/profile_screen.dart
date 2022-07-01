import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/user_photo.dart';
import 'package:CaptainSayedApp/screens/profile_screen/workout/prev_screen.dart';
import 'package:CaptainSayedApp/screens/settings_screen/settings_screen.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/user_info_listTile_item.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/user_data.dart';
import '../premium_acc_screen/premium_acc_screen.dart';
import '../settings_screen/widget_of_screen/top_of_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const screenName = "/profile-screen";
  @override
  Widget build(BuildContext context) {
    final birthdate = Provider.of<UserData>(context).userBithDate;

    final age = DateTime.now().year - int.parse(birthdate.substring(0, 4));
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Column(
            children: [
              TopOfScreen(
                lable: 'Profile',
              ),
              Column(
                children: [
                  SizedBox(height: 3.h),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.grey.shade900
                              : Colors.grey.shade50,
                          border: Border.all(
                            color: isDark ? Colors.transparent : Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 95.w,
                        height: 13.h,
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 2.w),
                                    UserPhot(true),
                                    SizedBox(width: 2.w),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 17.w),
                                          child: Row(
                                            children: [
                                              Consumer<UserData>(
                                                builder: (_, data, ch) => Text(
                                                  'Ahmed Ashraf',
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(width: 1.2.w),
                                              Image.asset(
                                                  'assets/images/check (3).png'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 6.w),
                                          child: Consumer<UserData>(
                                            builder: (_, data, ch) => Text(
                                              data.userEmail,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 40.w, top: 0.5.h),
                                          child: Consumer<UserData>(
                                            builder: (_, data, ch) => Container(
                                              width: 8.h,
                                              decoration: BoxDecoration(
                                                  color: primaryColor
                                                      .withOpacity(.3)),
                                              child: Text(
                                                data.getUserLevel,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: primaryColor),
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
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                      border: Border.all(
                        color: isDark ? Colors.transparent : Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 95.w,
                    height: 16.h,
                    child: Padding(
                      padding: EdgeInsets.only(top: 0.5.h, left: 2.w),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 3.w),
                                child: Text(
                                  'My Privileges',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.h),
                              Image.asset('assets/images/dumblee.png'),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 32.w, top: 1.5.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PrevScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                      'assets/images/down-arrow.png'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: Row(
                              children: [
                                Image.asset('assets/images/dum.png'),
                                SizedBox(width: 4.w),
                                Image.asset('assets/images/dum2.png'),
                                SizedBox(width: 4.w),
                                Image.asset('assets/images/mus2.png'),
                                SizedBox(width: 4.w),
                                Image.asset('assets/images/gym2.png'),
                                SizedBox(width: 4.w),
                                Image.asset('assets/images/lift.png'),
                                SizedBox(width: 4.w),
                                Image.asset('assets/images/wmn.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
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
                  SizedBox(height: 1.5.h),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                      border: Border.all(
                        color: isDark ? Colors.transparent : Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 96.w,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 31.w, top: 1.5.h),
                          child: Row(
                            children: [
                              Text('Personal Information'),
                              SizedBox(width: 19.w),
                              InkWell(
                                  child:
                                      Image.asset('assets/images/settings.png'),
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
            ],
          ),
        );
      },
    );
  }
}
