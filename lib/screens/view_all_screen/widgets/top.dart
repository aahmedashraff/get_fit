import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical),
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
            Text(
              "View All",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
              ),
            ),
          ],
        ));
  }
}
