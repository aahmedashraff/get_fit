import 'package:CaptainSayedApp/screens/profile_screen/edit_save_btn.dart';
import 'package:CaptainSayedApp/widgets/create_text_input11.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';

class ChangeNameScreen extends StatelessWidget {
  static const screenName = "/changename-screen";

  const ChangeNameScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            height: SizeConfig.screenHeight,
            child: Wrap(
              children: [
                Column(
                  children: [
                    SizedBox(height: 6.5.h),
                    Text(
                      'Change Name',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w),
                      child: Container(
                        width: 95.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.grey.shade900
                              : Colors.grey.shade50,
                          border: Border.all(
                            color: isDark
                                ? Colors.transparent
                                : Colors.grey.shade50,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First Name',
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 1.5.h),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 2.w, right: 2.w),
                                  child: TextFormField(
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primaryColor, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                      ),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      hintText: 'Ahmed',
                                      hintStyle: TextStyle(fontSize: 11.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Name',
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 1.5.h),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 2.w, right: 2.w),
                                  child: TextField(
                                    keyboardType: TextInputType.name,
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primaryColor, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                      ),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      hintText: 'Ashraf',
                                      hintStyle: TextStyle(fontSize: 11.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 45.5.h),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Container(
                          child: Text(
                            'Save',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: isDark
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade50,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              2.w,
                            ),
                            color: primaryColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 2.3.h,
                          ),
                          width: double.infinity,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
