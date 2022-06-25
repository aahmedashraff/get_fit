import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TopOfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal * 5,
        MediaQuery.of(context).padding.top,
        SizeConfig.blockSizeHorizontal * 8,
        0,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(width: SizeConfig.safeBlockVertical * 13),
          Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.safeBlockHorizontal * 4,
            ),
          )
        ],
      ),
    );
  }
}
