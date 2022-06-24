import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  static const screenName = "/download-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  "Downloads",
                  style:
                      TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
