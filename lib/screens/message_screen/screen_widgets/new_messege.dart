import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../message.dart';

class NewMessageScreen extends StatelessWidget {
  static const screenName = "/newmessage-screen";

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 6.5.h),
                    Row(
                      children: [
                        SizedBox(width: 5.w),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        SizedBox(
                          width: 26.w,
                        ),
                        Text(
                          "Message",
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 22.h,
                  left: 4.w,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () => Navigator.of(context)
                        .pushNamed(MessageScreen.screenName),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color: isDark ? Colors.transparent : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 40.w,
                      child: Image.asset('assets/images/newmsg.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 29.h),
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
                    height: 10.h,
                    child: Row(
                      children: [
                        SizedBox(width: 3.w),
                        Image.asset('assets/images/Group 2693.png'),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h),
                              Text(
                                'Get Fit App',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                'Thank You For Contacting Us, Your Problem Has Been Successfully Resolved',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //messagesRow
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 41.h),
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
                    height: 10.h,
                    child: Row(
                      children: [
                        SizedBox(width: 3.w),
                        Image.asset('assets/images/user.png'),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h),
                              Text(
                                'Me',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                'Hello, Can I Subscribe To The Premium So That I Can Get More Programs?',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                      ],
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
