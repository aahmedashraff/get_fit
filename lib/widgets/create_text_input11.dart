import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTextInput extends StatefulWidget {
  final String label;
  final bool isPassword;
  final bool showViewPasswordIcon;
  final bool isSubmitButtonClicked;
  final void Function(String value) updateStreamFunction;
  final AsyncSnapshot<String> snapShot;
  CreateTextInput({
    Key key,
    @required this.label,
    @required this.snapShot,
    @required this.isSubmitButtonClicked,
    @required this.updateStreamFunction,
    this.showViewPasswordIcon = false,
    this.isPassword = false,
  }) : super(key: key);
  @override
  _CreateTextInputState createState() => _CreateTextInputState();
}

class _CreateTextInputState extends State<CreateTextInput>
    with WidgetsBindingObserver {
  //all that lines from initState till dispose are to unfocus the text field
  // when soft keyboard is hidden when back is pressed

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void didChangeMetrics() {
  //   super.didChangeMetrics();
  //   final value = WidgetsBinding.instance.window.viewInsets.bottom;
  //   if (value == 0) {
  //     FocusScope.of(context).unfocus();
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  // }
  var _showPass = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 94,
            width: 397,
            child: TextFormField(
              cursorColor: primaryColor,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                errorText:
                    widget.isSubmitButtonClicked ? widget.snapShot.error : null,
                filled: true,
                focusColor: primaryColor,
                suffixIcon: widget.label == "Email"
                    ? Icon(
                        Icons.email_outlined,
                        color: Colors.grey.shade700,
                      )
                    : null,
                suffixIconColor: Colors.grey,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                hintText: "Enter your " + widget.label,
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.black26, fontSize: 14),
                ),
              ),
              keyboardType: widget.label == "Email"
                  ? TextInputType.emailAddress
                  : TextInputType.text,
              obscureText: widget.isPassword && !_showPass ? true : false,
              onChanged: (value) {
                widget.updateStreamFunction(value);
                if (widget.label == "Full name") {
                  Provider.of<UserData>(context, listen: false)
                      .updateFullName(value);
                }
              },
            ),
          ),
        ),
        if (widget.showViewPasswordIcon)
          Positioned(
            top: widget.snapShot.hasError && widget.isSubmitButtonClicked
                ? 0
                : null,
            right: 0,
            bottom: !widget.snapShot.hasError || !widget.isSubmitButtonClicked
                ? 0
                : null,
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 45),
              child: IconButton(
                icon: Icon(
                    _showPass
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey.shade700),
                onPressed: () {
                  setState(() {
                    _showPass = !_showPass;
                  });
                },
              ),
            ),
          ),
      ],
    );
  }
}
