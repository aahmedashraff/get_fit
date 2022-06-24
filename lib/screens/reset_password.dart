import 'package:CaptainSayedApp/providers/bloc/bloc.dart';
import 'package:CaptainSayedApp/services/auth.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/create_text_input11.dart';
import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const screenName = "reset-password";

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var _isSubmitClicked = false;
  var _isLoading = false;
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
                height: SizeConfig.safeBlockHorizontal * 11.5,
              ),
              Text(
                "Reset Password",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50),
              Text(
                "We will send a code to your Email to Reset Your Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 30,
              ),
              StreamBuilder<String>(
                stream: bloc.resetEmail,
                builder: (_, snap) => CreateTextInput(
                  label: "email",
                  snapShot: snap,
                  isSubmitButtonClicked: _isSubmitClicked,
                  updateStreamFunction: bloc.updateResetPasswordEmail,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 25,
              ),
              StreamBuilder<Object>(
                stream: bloc.resetEmail,
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
                        : NextOrSubmitButton("Reset Password"),
                  );
                },
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(Bloc bloc) async {
    FocusScope.of(context).unfocus();
    try {
      await Auth().restPassword(bloc.getResetPassEmail);
    } catch (e) {
      showDialogMessage(
          context: context,
          message:
              "This email may be not exist, please check your connetion and try again",
          title: "Error");
      setState(() {
        _isLoading = false;
      });
      return;
    }
    showDialogMessage(
        context: context,
        message: "Message has been sent successfully",
        title: "Done");
    bloc.disposeRestEmailStream();
    setState(() {
      _isLoading = false;
    });
  }
}
