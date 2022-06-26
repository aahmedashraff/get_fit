import 'package:CaptainSayedApp/screens/profile_screen/change_pass_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/create_text_input11.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/bloc/bloc.dart';
import '../../theme/theme_constant.dart';
import 'change_name.dart';

class AccountDataEdit extends StatefulWidget {
  const AccountDataEdit({Key key}) : super(key: key);
  static const screenName = "/accedit-screen";

  @override
  State<AccountDataEdit> createState() => _AccountDataEditState();
}

class _AccountDataEditState extends State<AccountDataEdit> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical),
            Text(
              'Account Data',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 6),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                  border: Border.all(
                    color: isDark ? Colors.transparent : Colors.grey.shade50,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 355,
                width: 397,
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
                              Text('Your Name'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: [
                              Text(
                                'Ahmed Ashraf',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(ChangeNameScreen.screenName),
                                child: Image.asset('assets/images/pen.png'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.5,
                        ),
                        Image.asset('assets/images/infoline.png'),
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
                              Text('Your Email'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: [
                              Text(
                                'aahmedashraff@gmail.com',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Spacer(),
                              Image.asset('assets/images/pen.png'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.5,
                        ),
                        Image.asset('assets/images/infoline.png'),
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
                              Text('Your Password'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: [
                              Text(
                                '***********',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(ChangePassScreen.screenName),
                                child: Image.asset('assets/images/pen.png'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.5,
                        ),
                        Image.asset('assets/images/infoline.png'),
                      ],
                    ),
                  ],
                ),
              ),
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
