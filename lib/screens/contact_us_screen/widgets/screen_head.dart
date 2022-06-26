import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ScreenHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical,
          right: SizeConfig.safeBlockHorizontal * 3,
          left: SizeConfig.safeBlockHorizontal * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          //Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
