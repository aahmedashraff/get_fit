import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

import '../theme/theme_constant.dart';

class LayoutOfAllFirstScreens extends StatelessWidget {
  static const screenName = "/layout-of-all-first-screens";

  final Widget cloumnOfData;
  const LayoutOfAllFirstScreens(this.cloumnOfData);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: cloumnOfData,
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.bottom,
              // horizontal: SizeConfig.safeBlockHorizontal * 5,
            ),
          ),
          Positioned(
            child: GestureDetector(
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
            left: SizeConfig.safeBlockHorizontal * 4,
            top: SizeConfig.safeBlockVertical * 4,
          ),
        ],
      ),
    );
  }
}
