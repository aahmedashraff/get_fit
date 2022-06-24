import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/message_screen/screen_widgets/screen_head.dart';
import 'package:CaptainSayedApp/screens/message_screen/screen_widgets/send_button.dart';
import 'package:CaptainSayedApp/screens/message_screen/screen_widgets/title_text_field.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  static const screenName = "/message-screen";

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var title = "";
  var message = "";
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.safeBlockVertical * 3,
          ),
          ScreenHead(),
          SizedBox(height: SizeConfig.safeBlockVertical * 4),
          Text(
            'Leave Your Inquiry',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            'Please leave your complaint and we will contact you',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 8),
          TitleTextField(getTextFieldValue: (value) => title = value),
          SizedBox(height: SizeConfig.safeBlockVertical * 2),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Container(
                    child: TextField(
                      onChanged: (value) => message = value,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          suffix: ImageIcon(
                            AssetImage(
                              'assets/images/pen (2).png',
                            ),
                          ),
                          hintText: "what's the problem?"),
                      minLines: 10,
                      maxLines: null,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                      border: Border.all(
                        color:
                            isDark ? Colors.transparent : Colors.grey.shade50,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 340,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Positioned(
                  top: 350,
                  left: 100,
                  child: InkWell(
                    onTap: _pickImage,
                    child: Container(
                      width: 205,
                      height: 100,
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color:
                              isDark ? Colors.transparent : Colors.grey.shade50,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/+.png'),
                          Text('Upload A Picture'),
                        ],
                      ),
                    ),
                  ),
                ),
                SendButton(
                  () async {
                    print("kkk");
                    if (message.isEmpty || title.isEmpty) return;
                    FocusScope.of(context).unfocus();
                    await Future.delayed(Duration(milliseconds: 100));
                    try {
                      await sendMessage(
                        message: message,
                        title: title,
                        token: Provider.of<UserData>(context, listen: false)
                            .userToken,
                      );
                      showDialogMessage(
                        context: context,
                        title: "Done",
                        message: "Your message has been sent successfully",
                      );
                    } catch (e) {
                      showErrorMessage(context: context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e);
    }
  }
}
