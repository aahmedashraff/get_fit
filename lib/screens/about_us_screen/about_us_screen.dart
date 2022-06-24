import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/screens/about_us_screen/about_paragraph.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/Fat.jpg",
                    width: double.infinity,
                    height: SizeConfig.safeBlockVertical * 25,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(SizeConfig.safeBlockHorizontal * 3),
                    bottomRight:
                        Radius.circular(SizeConfig.safeBlockHorizontal * 3),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.6),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          SizeConfig.safeBlockHorizontal * 3,
                        ),
                        bottomRight: Radius.circular(
                          SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "About",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: SizeConfig.safeBlockHorizontal * 4,
                  top: MediaQuery.of(context).padding.top,
                  child: IconButton(
                    icon: Icon(
                      AppIcon.back,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
              child: Text(
                "Get Fit",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Paragraph(),
            Spacer(flex: 8),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom +
              SizeConfig.safeBlockVertical,
        ),
        height: SizeConfig.screenHeight,
      ),
      backgroundColor: Color(0xFFE9E9E9)
    );
  }
}
