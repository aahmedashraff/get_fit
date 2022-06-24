import 'package:CaptainSayedApp/providers/bloc/bloc.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/reset_password.dart';
import 'package:CaptainSayedApp/services/auth.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/create_text_input11.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class LoginScreen extends StatefulWidget {
  static const screenName = "/login-screen";
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isSubmitClicked = false;
  var _isLoading = false;
  bool isHideenPass = true;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);

    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 10,
              ),
              Text(
                "Login By Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 30,
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     style: TextStyle(color: Colors.black),
              //     decoration: InputDecoration(
              //         filled: true,
              //         fillColor: Colors.white,
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(13),
              //         ),
              //         suffixIcon: Icon(Icons.email_outlined),
              //         hintText: 'enter your email '),
              //     keyboardType: TextInputType.emailAddress,
              //   ),
              // ),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Text(
                      'email',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),

              StreamBuilder<String>(
                stream: bloc.signInEmail,
                builder: (_, snap) => CreateTextInput(
                  label: "email",
                  snapShot: snap,
                  isSubmitButtonClicked: _isSubmitClicked,
                  updateStreamFunction: bloc.updateSignInEmail,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 10,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Text(
                      'password',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ],
              ),

              // PASS_Text_input
              StreamBuilder<String>(
                stream: bloc.signInPass,
                builder: (_, snap) => CreateTextInput(
                  label: "password",
                  showViewPasswordIcon: true,
                  isPassword: true,
                  snapShot: snap,
                  isSubmitButtonClicked: _isSubmitClicked,
                  updateStreamFunction: bloc.updateSignInPass,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ResetPasswordScreen.screenName);
                },
                child: Row(
                  children: [
                    Text(
                      'Forgot your password?',
                      style:
                          TextStyle(color: Colors.red.shade400, fontSize: 12),
                    ),
                  ],
                ),
              ),
              StreamBuilder<Object>(
                  stream: bloc.validateSubmitionForLogIn,
                  builder: (context, snapshot) {
                    return GestureDetector(
                      onTap: _isLoading
                          ? null
                          : snapshot.hasData
                              ? () => _submit(bloc)
                              : () {
                                  if (!_isSubmitClicked) {
                                    setState(() {
                                      _isSubmitClicked = true;
                                    });
                                  }
                                },
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : NextOrSubmitButton("log in"),
                    );
                  }),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(ResetPasswordScreen.screenName),
                child: SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                // Text(
                //   "Forgot your password?",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: SizeConfig.safeBlockHorizontal * 4,
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _submit(Bloc bloc) async {
  //   FocusScope.of(context).unfocus();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     await Auth()
  //         .signInWithEmailAndPass(bloc.getSignInEmail, bloc.getSignInPass);
  //   } catch (e) {
  //     showErrorMessage(context: context, error: e.toString());
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     return;
  //   }
  //   bloc.dispose();

  //   setState(() {
  //     _isLoading = false;
  //   });
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (_) => PremiumAccScreen()),
  //     (_) => false,
  //   );
  // }

  Future<void> _submit(Bloc bloc) async {
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });

    try {
      await Auth().signInWithEmailAndPass(
          email: bloc.getSignInEmail,
          pass: bloc.getSignInPass,
          context: context);
    } catch (e) {
      showDialogMessage(
          context: context,
          title: "An error occurred",
          message:
              "This email or password may be wrong, please check your connection and try again.");
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
        .setUserEmail(bloc.getSignInEmail);
    bloc.dispose();
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeScreen()), (_) => false);
  }

  void _togglePassView() {
    if (isHideenPass == true) {
      isHideenPass = false;
    } else {
      isHideenPass = true;
    }
    setState(() {});
  }
}
