import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatelessWidget {
  static const screenName = "/notification-screen";

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
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 7.h),
                    Row(
                      children: [
                        SizedBox(width: 4.w),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 150),
                  child: Container(
                    width: 95.w,
                    height: 10.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        enableFeedback: true,
                        elevation: MaterialStateProperty.all(10),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                        backgroundColor: MaterialStateProperty.all(
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        ),
                      ),
                      onPressed: null,
                      child: Row(
                        children: [
                          Image.asset('assets/images/achivment.png'),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'New Achievement',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  Text(
                                    'I Got Your First Achievement For Completing Some Exercises',
                                    style: TextStyle(fontSize: 10.sp),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //messagesRow
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 260),
                  child: Container(
                    width: 95.w,
                    height: 10.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        enableFeedback: true,
                        elevation: MaterialStateProperty.all(10),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                        backgroundColor: MaterialStateProperty.all(
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        ),
                      ),
                      onPressed: null,
                      child: Row(
                        children: [
                          Image.asset('assets/images/timer.png'),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'New Program',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  Text(
                                    'Weight Loss Program Is Now Available,Try It Now',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
