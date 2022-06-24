import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

import '../../../app_icon_icons.dart';
import '../message.dart';

class NewMessageScreen extends StatelessWidget {
  static const screenName = "/newmessage-screen";

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 10),
                Row(
                  children: [
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                    GestureDetector(
                      child: Icon(
                        AppIcon.back,
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 30,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 180,
              left: 12,
              child: InkWell(
                highlightColor: Colors.white,
                onTap: () =>
                    Navigator.of(context).pushNamed(MessageScreen.screenName),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                    border: Border.all(
                      color: isDark ? Colors.transparent : Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 147,
                  height: 31,
                  child: Image.asset('assets/images/newmsg.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 230),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                  border: Border.all(
                    color: isDark ? Colors.transparent : Colors.grey.shade50,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 397,
                height: 85,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset('assets/images/Group 2693.png'),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Getfit App',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Thank You For Contacting Us, Your Problem Has Been Successfully Resolved',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //messagesRow
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 340),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                  border: Border.all(
                    color: isDark ? Colors.transparent : Colors.grey.shade50,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 397,
                height: 85,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset('assets/images/user.png'),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Me',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Hello, Can I Subscribe To The Premium So That I Can Get More Programs?',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
