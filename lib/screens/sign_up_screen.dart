// ignore_for_file: prefer_const_constructors

import 'package:CaptainSayedApp/providers/bloc/bloc.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/premium_acc_screen/premium_acc_screen.dart';
import 'package:CaptainSayedApp/services/auth.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:CaptainSayedApp/widgets/create_text_input11.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  static const screenName = "sign-up";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _isSubmitedclicked = false;
  var _isLoading = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bloc = Provider.of<Bloc>(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return WillPopScope(
          onWillPop: () async {
            bloc.resetStreamsValue();
            FocusScope.of(context).unfocus();
            return true;
          },
          child: SizedBox(
            height: 100.h,
            width: SizeConfig.screenWidth,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 6.5.h,
                    ),
                    Text(
                      "Create An Account",
                      style: TextStyle(fontSize: 20.sp),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: isDark
                          ? Image.asset(
                              'assets/images/createaccindidark.png',
                              height: 28.h,
                            )
                          : Image.asset('assets/images/createaccindilight.png'),
                    ),

                    //choose_gender_txt
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Full Name'),
                        ],
                      ),
                    ),
                    StreamBuilder<String>(
                      stream: bloc.fullName,
                      builder: (_, snap) => CreateTextInput(
                        label: "Full Name",
                        snapShot: snap,
                        isSubmitButtonClicked: _isSubmitedclicked,
                        updateStreamFunction: bloc.updateFullName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Email'),
                        ],
                      ),
                    ),

                    StreamBuilder<String>(
                      stream: bloc.email,
                      builder: (_, snap) => CreateTextInput(
                        label: "Email",
                        snapShot: snap,
                        isSubmitButtonClicked: _isSubmitedclicked,
                        updateStreamFunction: bloc.updateEmail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Password'),
                        ],
                      ),
                    ),

                    StreamBuilder<String>(
                      stream: bloc.password,
                      builder: (_, snap) => CreateTextInput(
                        label: "Password",
                        isPassword: true,
                        showViewPasswordIcon: true,
                        snapShot: snap,
                        isSubmitButtonClicked: _isSubmitedclicked,
                        updateStreamFunction: bloc.updatePass,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Confirm Password'),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        StreamBuilder<String>(
                          stream: bloc.password,
                          builder: (_, snap) => CreateTextInput(
                            label: "Password",
                            snapShot: snap,
                            isSubmitButtonClicked: _isSubmitedclicked,
                            updateStreamFunction: bloc.updatePass,
                            isPassword: true,
                            showViewPasswordIcon: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  focusColor: Colors.transparent,
                                  splashRadius: 15,
                                  fillColor: MaterialStateProperty.all<Color>(
                                      primaryColor),
                                  checkColor: Colors.black,
                                  value: agree,
                                  onChanged: (bool value) {
                                    setState(() {
                                      agree = value;
                                    });
                                  }),
                              Text(
                                'I Agree To The Terms And Conditions Of The Application',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    //if (!_isLoading)
                    StreamBuilder(
                      stream: bloc.validateSubmitionForSignUp,
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: _isLoading
                              ? null
                              : snapshot.hasData
                                  ? () => _submit(bloc)
                                  : () {
                                      if (!_isSubmitedclicked) {
                                        setState(() {
                                          _isSubmitedclicked = true;
                                        });
                                      }
                                    },
                          child: NextOrSubmitButton(
                            "Create Account",
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 1.5.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _submit(Bloc bloc) async {
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });

    try {
      await Auth().signUpwithEmailAndPass(
          email: bloc.getEmail,
          pass: bloc.getPass,
          fullName: bloc.getFullName,
          userData: Provider.of<UserData>(context, listen: false).getUserData,
          context: context);
    } catch (e) {
      showDialogMessage(
          context: context,
          title: "An error occurred",
          message:
              "This email may be already existed, please check your connection and try again.");
      setState(() {
        _isLoading = false;
      });
      return;
    }
    // setState(() {
    //   _isLoading = false;
    // });
    // return;
    await Provider.of<UserData>(context, listen: false)
        .saveUserFullName(name: bloc.getFullName);
    await Provider.of<UserData>(context, listen: false)
        .setUserEmail(bloc.getEmail);
    bloc.dispose();
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => PremiumAccScreen()), (_) => false);
  }
}
