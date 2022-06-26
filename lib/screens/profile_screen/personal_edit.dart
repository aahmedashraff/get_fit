import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/person_edit_photo.dart';
import 'package:CaptainSayedApp/screens/profile_screen/weight_edit.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_data.dart';
import 'package:popup_window/popup_window.dart';
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

const double windowHeight = 646;

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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SizeConfig().init(context);

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
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Container(
              width: 397,
              height: 523,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                border: Border.all(
                  color: isDark ? Colors.transparent : Colors.grey.shade50,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 5,
                            ),
                            Row(
                              children: [
                                Text('Your age'),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('26'),
                                ),
                                Spacer(flex: 1),
                                MaterialButton(
                                    minWidth: 10,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    key: agebtnKey,
                                    child: Image.asset('assets/images/pen.png'),
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
                          height: SizeConfig.safeBlockVertical * 3,
                        ),
                        Row(
                          children: [
                            Text('Your Weight'),
                          ],
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('67'),
                            ),
                            Spacer(flex: 1),
                            MaterialButton(
                                minWidth: 10,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                key: weightbtnKey,
                                child: Image.asset('assets/images/pen.png'),
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
                                                    BorderRadius.circular(10),
                                              ),
                                              height:
                                                  SizeConfig.safeBlockVertical *
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
                          height: SizeConfig.safeBlockVertical * 3,
                        ),
                        Row(
                          children: [
                            Text('Your Height'),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('163'),
                            ),
                            Spacer(flex: 1),
                            MaterialButton(
                                minWidth: 10,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                key: heightbtnKey,
                                child: Image.asset('assets/images/pen.png'),
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
                                                    BorderRadius.circular(10),
                                              ),
                                              height:
                                                  SizeConfig.safeBlockVertical *
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
                          height: SizeConfig.safeBlockVertical * 3,
                        ),
                        Row(
                          children: [
                            Text('Your Fat'),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('25%'),
                            ),
                            Spacer(flex: 1),
                            MaterialButton(
                              minWidth: 10,
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              key: fatbtnKey,
                              child: Image.asset('assets/images/pen.png'),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            height:
                                                SizeConfig.safeBlockVertical *
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
                                minWidth: 10,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                key: genderbtnKey,
                                child: Image.asset('assets/images/pen.png'),
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
                                                    BorderRadius.circular(10),
                                              ),
                                              height:
                                                  SizeConfig.safeBlockVertical *
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
                        Image.asset('assets/images/linee.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            NextOrSubmitButton('Save'),
          ],
        ),
      ),
    );
  }
}
