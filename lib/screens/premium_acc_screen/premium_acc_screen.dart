import 'package:CaptainSayedApp/screens/premium_acc_screen/buy_program.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PremiumAccScreen extends StatelessWidget {
  static const screenName = "/prem-screen";

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            height: SizeConfig.screenHeight,
            child: Stack(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: isDark
                        ? Image.asset('assets/images/premx.png')
                        : Image.asset('assets/images/Group 2948.png'),
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: isDark
                            ? Image.asset(
                                'assets/images/premfirst.png',
                                height: 30.h,
                              )
                            : Image.asset(
                                'assets/images/premfit.png',
                                height: 30.h,
                              ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 14.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w, top: 18.h),
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
                      height: 17.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h, left: 2.w),
                            child: Image.asset('assets/images/Group 2950.png'),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.h),
                                Text(
                                  'Stronger Programs',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                SizedBox(height: 1.5.h),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Text(
                                    'Get Fit Premium Offers Many Powerful Programs That Focus More On Developing Your Body Quickly And Effectively Than Routine Programs',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w, top: 38.h),
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
                      height: 17.h,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h, left: 2.w),
                            child: Image.asset('assets/images/Group 2951.png'),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.h),
                                Text(
                                  'Private Follow Up',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                SizedBox(height: 1.5.h),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Text(
                                    'Subscribing To Get Fit Premium Gives You A Very Powerful And Important Advantage, To Personally Follow Captain Syed Hussain, Someone With Over 20 Years Of Online Training Experience.',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 14.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w, top: 58.h),
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
                      height: 17.h,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 90, left: 10),
                            child: Image.asset('assets/images/Group 2952.png'),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.h),
                                Text(
                                  'Constant Updates',
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(height: 1.5.h),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Text(
                                    'Get Fit Premium Has A Working Team Around The Clock That Provides Periodic Updates And Is Constantly Developing The Application',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                NextOrSubmitButton(
                  'Subscribe Now',
                  onPress: () => Navigator.of(context)
                      .pushNamed(BuyProgramScreen.screenName),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
