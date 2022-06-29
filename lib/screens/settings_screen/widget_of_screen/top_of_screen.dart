import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_constant.dart';

class TopOfScreen extends StatelessWidget {
  final String lable;

  const TopOfScreen({Key key, @required this.lable}) : super(key: key);
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
          GestureDetector(
            onTap: () {
              Future.delayed(Duration(milliseconds: 150))
                  .then((_) => Navigator.of(context).pop());
              FocusScope.of(context).unfocus();
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: primaryColor,
            ),
          ),
          SizedBox(width: SizeConfig.safeBlockVertical * 15),
          Text(
            '$lable',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
