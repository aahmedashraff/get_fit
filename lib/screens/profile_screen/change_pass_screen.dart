import 'package:CaptainSayedApp/screens/profile_screen/pass_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/bloc/bloc.dart';
import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';

class ChangePassScreen extends StatefulWidget {
  static const screenName = "/changepass-screen";

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

final TextEditingController _pass = TextEditingController();
final TextEditingController _confirmPass = TextEditingController();
final GlobalKey<FormState> _form = GlobalKey<FormState>();
final _formKey = GlobalKey<FormState>();

String _password = '';
String _confirmPassword = '';

class _ChangePassScreenState extends State<ChangePassScreen> {
  bool _isObscure = true;

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
                SizedBox(height: SizeConfig.safeBlockVertical * 1.2),
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 45,
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
                                  Text('Old Password'),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: SizeConfig.safeBlockVertical * 1.8),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                controller: _pass,
                                validator: (val) {
                                  if (val.isEmpty) return 'Empty';
                                  return null;
                                },
                                obscureText: _isObscure,
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
                                  hintText: '***********',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey.shade500,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
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
                                  Text('New Password'),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: SizeConfig.safeBlockVertical * 1.8),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                controller: _confirmPass,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Password is required please enter';
                                  }
                                  // you can check password length and specifications

                                  return null;
                                },
                                onChanged: (value) {
                                  _password = value;
                                },
                                obscureText: _isObscure,
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
                                  hintText: '***********',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey.shade500,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
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
                                  Text('Confirm Password'),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: SizeConfig.safeBlockVertical * 1.8),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Form(
                                key: _form,
                                child: TextFormField(
                                  controller: _confirmPass,
                                  onChanged: (value) {
                                    _confirmPassword = value;
                                  },
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Conform password is required please enter';
                                    }
                                    if (value != _password) {
                                      return 'Confirm password not matching';
                                    }
                                    return null;
                                  },
                                  obscureText: _isObscure,
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
                                    hintText: '***********',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey.shade500,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 22.2),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => {
                    // validate all forms fields
                    if (_formKey.currentState.validate())
                      {
                        // do the API call here
                      }
                  },
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
