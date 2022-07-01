import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/person_edit_photo.dart';
import 'package:CaptainSayedApp/screens/profile_screen/weight_edit.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../providers/user_data.dart';
import 'age_edit.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';
import 'fat_edit.dart';
import 'gender_edit.dart';
import 'height_edit.dart';

class PersonalEdit extends StatefulWidget {
  static const screenName = "personal";

  const PersonalEdit({Key key}) : super(key: key);

  @override
  State<PersonalEdit> createState() => _PersonalEditState();
}

class _PersonalEditState extends State<PersonalEdit> {
  int currentAgeValue = 0;
  GlobalKey agebtnKey = GlobalKey();
  GlobalKey weightbtnKey = GlobalKey();
  GlobalKey heightbtnKey = GlobalKey();
  GlobalKey fatbtnKey = GlobalKey();
  GlobalKey genderbtnKey = GlobalKey();
  KumiPopupWindow popupWindow;

  ValueNotifier<bool> isSelect = ValueNotifier(false);
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 6.5.h),
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
                        width: 22.w,
                      ),
                      Text(
                        "Personal Edit",
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Stack(
                    children: [
                      PersonEditPhoto(true),

                      // Positioned(
                      //   left: 0.0.h,
                      //   top: 0.2.h,
                      //   bottom: .2.h,
                      //   child: Image.asset(
                      //     'assets/images/photedit.png',
                      //     width: 18.1.w,
                      //     color: Colors.grey.shade700,
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 1.8.h,
                  ),
                  Consumer<UserData>(
                    builder: (_, data, ch) => Text(
                      'Ahmed Ashraf',
                      style: TextStyle(
                          fontSize: 18.sp,
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 95.w,
                    height: 51.h,
                    decoration: BoxDecoration(
                      color:
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                      border: Border.all(
                        color:
                            isDark ? Colors.transparent : Colors.grey.shade50,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text('Your age'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: Text('26'),
                                      ),
                                      Spacer(flex: 1),
                                      MaterialButton(
                                          minWidth: 10.w,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          key: agebtnKey,
                                          child: Image.asset(
                                            'assets/images/pen.png',
                                            color: isDark
                                                ? Colors.grey.shade50
                                                : Colors.black,
                                          ),
                                          onPressed: () {
                                            /*showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context1, StateSetter setBottomSheetState) {
                                return SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setBottomSheetState(() {
                                            aaa = "true";
                                          });
                                          },
                                          child: Text("asdasdasd"),
                                        ),
                                        TextField(
                                          controller: TextEditingController(text: aaa),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly], //只允许输入数字
                                          textInputAction: TextInputAction.done,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          });*/
                                            showPopupWindow(
                                              context,
                                              gravity:
                                                  KumiPopupGravity.centerBottom,
                                              curve: Curves.easeInOutCirc,
                                              bgColor:
                                                  Colors.black.withOpacity(0.6),
                                              clickOutDismiss: true,
                                              clickBackDismiss: true,
                                              customAnimation: false,
                                              customPop: false,
                                              customPage: false,

                                              underStatusBar: false,
                                              underAppBar: false,
                                              //offsetX: -180,
                                              //offsetY: 50,
                                              duration:
                                                  Duration(milliseconds: 200),

                                              childFun: (pop) {
                                                return StatefulBuilder(
                                                    key: GlobalKey(),
                                                    builder:
                                                        (popContext, popState) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isDark
                                                              ? Colors
                                                                  .grey.shade900
                                                              : Colors
                                                                  .grey.shade50,
                                                          border: Border.all(
                                                            color: isDark
                                                                ? Colors
                                                                    .transparent
                                                                : Colors.grey
                                                                    .shade50,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        height: SizeConfig
                                                                .safeBlockVertical *
                                                            80,
                                                        alignment:
                                                            Alignment.center,
                                                        child: AgeEditScreen(),
                                                      );
                                                    });
                                              },
                                            );
                                          }),
                                    ],
                                  ),
                                  Image.asset('assets/images/linee.png'),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text('Your Weight'),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text('67'),
                                  ),
                                  Spacer(flex: 1),
                                  MaterialButton(
                                      minWidth: 10.w,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      key: weightbtnKey,
                                      child: Image.asset(
                                        'assets/images/pen.png',
                                        color: isDark
                                            ? Colors.grey.shade50
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        showPopupWindow(
                                          context,
                                          gravity:
                                              KumiPopupGravity.centerBottom,
                                          curve: Curves.easeInOutCirc,
                                          bgColor:
                                              Colors.black.withOpacity(0.6),
                                          clickOutDismiss: true,
                                          clickBackDismiss: true,
                                          customAnimation: false,
                                          customPop: false,
                                          customPage: false,

                                          underStatusBar: false,
                                          underAppBar: false,
                                          //offsetX: -180,
                                          //offsetY: 50,
                                          duration: Duration(milliseconds: 200),

                                          childFun: (pop) {
                                            return StatefulBuilder(
                                                key: GlobalKey(),
                                                builder:
                                                    (popContext, popState) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: isDark
                                                          ? Colors.grey.shade900
                                                          : Colors.grey.shade50,
                                                      border: Border.all(
                                                        color: isDark
                                                            ? Colors.transparent
                                                            : Colors
                                                                .grey.shade50,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: SizeConfig
                                                            .safeBlockVertical *
                                                        80,
                                                    alignment: Alignment.center,
                                                    child: WeightEditScreen(),
                                                  );
                                                });
                                          },
                                        );
                                      }),
                                ],
                              ),
                              Image.asset('assets/images/linee.png'),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text('Your Height'),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text('163'),
                                  ),
                                  Spacer(flex: 1),
                                  MaterialButton(
                                      minWidth: 10.w,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      key: heightbtnKey,
                                      child: Image.asset(
                                        'assets/images/pen.png',
                                        color: isDark
                                            ? Colors.grey.shade50
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        showPopupWindow(
                                          context,
                                          gravity:
                                              KumiPopupGravity.centerBottom,
                                          curve: Curves.easeInOutCirc,
                                          bgColor:
                                              Colors.black.withOpacity(0.6),
                                          clickOutDismiss: true,
                                          clickBackDismiss: true,
                                          customAnimation: false,
                                          customPop: false,
                                          customPage: false,

                                          underStatusBar: false,
                                          underAppBar: false,
                                          //offsetX: -180,
                                          //offsetY: 50,
                                          duration: Duration(milliseconds: 200),

                                          childFun: (pop) {
                                            return StatefulBuilder(
                                                key: GlobalKey(),
                                                builder:
                                                    (popContext, popState) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: isDark
                                                          ? Colors.grey.shade900
                                                          : Colors.grey.shade50,
                                                      border: Border.all(
                                                        color: isDark
                                                            ? Colors.transparent
                                                            : Colors
                                                                .grey.shade50,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: SizeConfig
                                                            .safeBlockVertical *
                                                        80,
                                                    alignment: Alignment.center,
                                                    child: HeightEditScreen(),
                                                  );
                                                });
                                          },
                                        );
                                      }),
                                ],
                              ),
                              Image.asset('assets/images/linee.png'),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text('Your Fat'),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text('25%'),
                                  ),
                                  Spacer(flex: 1),
                                  MaterialButton(
                                    minWidth: 10.w,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    key: fatbtnKey,
                                    child: Image.asset(
                                      'assets/images/pen.png',
                                      color: isDark
                                          ? Colors.grey.shade50
                                          : Colors.black,
                                    ),
                                    onPressed: () {
                                      showPopupWindow(
                                        context,
                                        gravity: KumiPopupGravity.centerBottom,
                                        curve: Curves.easeInOutCirc,
                                        bgColor: Colors.black.withOpacity(0.6),
                                        clickOutDismiss: true,
                                        clickBackDismiss: true,
                                        customAnimation: false,
                                        customPop: false,
                                        customPage: false,

                                        underStatusBar: false,
                                        underAppBar: false,
                                        //offsetX: -180,
                                        //offsetY: 50,
                                        duration: Duration(milliseconds: 200),

                                        childFun: (pop) {
                                          return StatefulBuilder(
                                              key: GlobalKey(),
                                              builder: (popContext, popState) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: isDark
                                                        ? Colors.grey.shade900
                                                        : Colors.grey.shade50,
                                                    border: Border.all(
                                                      color: isDark
                                                          ? Colors.transparent
                                                          : Colors.grey.shade50,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      80,
                                                  alignment: Alignment.center,
                                                  child: FatEditScreen(),
                                                );
                                              });
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Image.asset('assets/images/linee.png'),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 3,
                              ),
                              Row(
                                children: [
                                  Text('Your Gender'),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('Male'),
                                  ),
                                  Spacer(flex: 1),
                                  MaterialButton(
                                      minWidth: 10.w,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      key: genderbtnKey,
                                      child: Image.asset(
                                        'assets/images/pen.png',
                                        color: isDark
                                            ? Colors.grey.shade50
                                            : Colors.black,
                                      ),
                                      onPressed: () {
                                        showPopupWindow(
                                          context,
                                          gravity:
                                              KumiPopupGravity.centerBottom,
                                          curve: Curves.easeInOutCirc,
                                          bgColor:
                                              Colors.black.withOpacity(0.6),
                                          clickOutDismiss: true,
                                          clickBackDismiss: true,
                                          customAnimation: false,
                                          customPop: false,
                                          customPage: false,

                                          underStatusBar: false,
                                          underAppBar: false,
                                          //offsetX: -180,
                                          //offsetY: 50,
                                          duration: Duration(milliseconds: 200),

                                          childFun: (pop) {
                                            return StatefulBuilder(
                                                key: GlobalKey(),
                                                builder:
                                                    (popContext, popState) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: isDark
                                                          ? Colors.grey.shade900
                                                          : Colors.grey.shade50,
                                                      border: Border.all(
                                                        color: isDark
                                                            ? Colors.transparent
                                                            : Colors
                                                                .grey.shade50,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: SizeConfig
                                                            .safeBlockVertical *
                                                        80,
                                                    alignment: Alignment.center,
                                                    child: GenderEditScreen(),
                                                  );
                                                });
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  NextOrSubmitButton('Save'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
