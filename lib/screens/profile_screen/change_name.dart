import 'package:CaptainSayedApp/screens/profile_screen/edit_save_btn.dart';
import 'package:CaptainSayedApp/widgets/create_text_input11.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';

class ChangeNameScreen extends StatelessWidget {
  static const screenName = "/changename-screen";

  const ChangeNameScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        child: Wrap(
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 1.9),
                Text('Change Name'),
                SizedBox(height: SizeConfig.safeBlockVertical * 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 33,
                    decoration: BoxDecoration(
                      color:
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                      border: Border.all(
                        color:
                            isDark ? Colors.transparent : Colors.grey.shade50,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('First Name'),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: SizeConfig.safeBlockVertical * 1.8),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: primaryColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  hintText: 'Ahmed',
                                  hintStyle: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: SizeConfig.safeBlockVertical * 3),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Last Name'),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: SizeConfig.safeBlockVertical * 1.8),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                keyboardType: TextInputType.name,
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: primaryColor, width: 2.0),
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  hintText: 'Ashraf',
                                  hintStyle: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: isDark
                                ? Colors.grey.shade900
                                : Colors.grey.shade50,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 2,
                        ),
                        color: primaryColor,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 2.5,
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
  }
}
