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
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 22,
          ),
          Text(
            "New Message",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
            ),
          ),
        ],
      ),
    );
  }
}
