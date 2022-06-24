import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical * 5,
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(AppIcon.back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 120,
              ),
              child: Text(
                "Favorites",
                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4),
              ),
            )
          ],
        ),
      ],
    );
  }
}
