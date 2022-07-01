import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/theme_constant.dart';

class LayoutOfAllFirstScreens extends StatelessWidget {
  static const screenName = "/layout-of-all-first-screens";

  final Widget cloumnOfData;
  const LayoutOfAllFirstScreens(this.cloumnOfData);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Stack(
            children: [
              cloumnOfData,
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
                    size: 3.h,
                  ),
                ),
                left: SizeConfig.safeBlockHorizontal * 4,
                top: 6.5.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
