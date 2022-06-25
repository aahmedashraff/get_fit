import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ScreenHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 31.5,
          ),
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal,
        right: SizeConfig.safeBlockHorizontal * 3,
      ),
      width: SizeConfig.safeBlockHorizontal * 100,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }
}
