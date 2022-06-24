import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class LayoutOfAllFirstScreens extends StatelessWidget {
  static const screenName = "/layout-of-all-first-screens";

  final Widget cloumnOfData;
  const LayoutOfAllFirstScreens(this.cloumnOfData);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.black.withOpacity(.1)),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: cloumnOfData,
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).padding.bottom,
                // horizontal: SizeConfig.safeBlockHorizontal * 5,
              ),
            ),
            Positioned(
              child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(AppIcon.back),
                onPressed: () {
                  //those next tow lines is to avoid an error which is occured
                  // when pressing navigate.pop from this page and the
                  //keyboard is visible. the previous page is get out of bound
                  // for a moment
                  Future.delayed(Duration(milliseconds: 150))
                      .then((_) => Navigator.of(context).pop());
                  FocusScope.of(context).unfocus();
                },
              ),
              left: SizeConfig.safeBlockHorizontal * 4,
              top: SizeConfig.safeBlockVertical * 4,
            ),
          ],
        ),
      ),
    );
  }
}
