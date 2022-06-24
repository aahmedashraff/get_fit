import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/contact_us_screen/widgets/screen_head.dart';
import 'package:CaptainSayedApp/screens/contact_us_screen/widgets/send_button.dart';
import 'package:CaptainSayedApp/screens/contact_us_screen/widgets/title_text_field.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  var title = "";
  var message = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            ScreenHead(),
            Spacer(flex: 2),
            TitleTextField(isForTitle: false),
            Spacer(flex: 1),
            TitleTextField(
              getTextFieldValue: (value) => title = value,
              isForTitle: true,
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 30,
              child: Container(
                child: TextField(
                  onChanged: (value) => message = value,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration.collapsed(hintText: "Message"),
                  minLines: 10,
                  maxLines: null,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 3,
                  vertical: SizeConfig.safeBlockVertical * 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
                ),
              ),
            ),
            Spacer(),
            SendButton(() async {
              print("kkk");
              if (message.isEmpty || title.isEmpty) return;
              FocusScope.of(context).unfocus();
              await Future.delayed(Duration(milliseconds: 100));
              try {
                await sendMessage(
                  message: message,
                  title: title,
                  token:
                      Provider.of<UserData>(context, listen: false).userToken,
                );
                showDialogMessage(
                  context: context,
                  title: "Done",
                  message: "Your message has been sent successfully",
                );
              } catch (e) {
                showErrorMessage(context: context);
              }
            })
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        right: SizeConfig.safeBlockHorizontal * 5,
        left: SizeConfig.safeBlockHorizontal * 5,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFE9E9E9),
      ),
    );
  }
}
