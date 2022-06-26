import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/person_edit_photo.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:o_popup/o_popup.dart';
import 'package:provider/provider.dart';
import '../../providers/user_data.dart';
import '../../theme/theme_constant.dart';
import 'package:popup_window/popup_window.dart';

import 'age_edit.dart';

class PersonalEdit extends StatefulWidget {
  static const screenName = "personal";

  const PersonalEdit({Key key}) : super(key: key);

  @override
  State<PersonalEdit> createState() => _PersonalEditState();
}

class _PersonalEditState extends State<PersonalEdit> {
  int currentAgeValue = 0;
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
                            SizedBox(height: SizeConfig.safeBlockVertical * 2),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('26'),
                                ),
                                Spacer(flex: 1),
                                PopupWindowButton(
                                  buttonBuilder: (BuildContext context) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child:
                                          Image.asset('assets/images/pen.png'),
                                    );
                                  },
                                  windowBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return ScaleTransition(
                                      alignment: Alignment.bottomCenter,
                                      scale: animation,
                                      child: SizeTransition(
                                        sizeFactor: animation,
                                        child: Container(
                                          child: AgeEditScreen(),
                                          height: 646,
                                          width: 397,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 2,
                            ),
                            Image.asset('assets/images/linee.png'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset('assets/images/pen.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
                        ),
                        Image.asset('assets/images/linee.png'),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Row(
                          children: [
                            Text('Your Height'),
                          ],
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('163'),
                            ),
                            Spacer(flex: 1),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset('assets/images/pen.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
                        ),
                        Image.asset('assets/images/linee.png'),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Row(
                          children: [
                            Text('Your Fat'),
                          ],
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('25%'),
                            ),
                            Spacer(flex: 1),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset('assets/images/pen.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
                        ),
                        Image.asset('assets/images/linee.png'),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Row(
                          children: [
                            Text('Your Gender'),
                          ],
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Male'),
                            ),
                            Spacer(flex: 1),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset('assets/images/pen.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
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
