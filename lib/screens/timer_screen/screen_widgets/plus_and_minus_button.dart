import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class PlusAndMinusButton extends StatelessWidget {
  final bool isPlus;
  final Function onPress;

  const PlusAndMinusButton({@required this.isPlus, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
          icon: Icon(isPlus ? AppIcon.plus : AppIcon.minus),
          onPressed: onPress,
          color: Colors.white,
          iconSize: (SizeConfig.safeBlockHorizontal +
                  SizeConfig.safeBlockVertical) /
              2 *
              4,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
        ),
        margin: EdgeInsets.only(
          right: isPlus ? 0 : SizeConfig.safeBlockHorizontal*1.5,
          left: isPlus ? SizeConfig.safeBlockHorizontal*1.5 : 0,
        ));
  }
}

//  (SizeConfig.safeBlockHorizontal + SizeConfig.safeBlockVertical) /
//                 2 *
//                 9
// isPlus ? Icons.add_box : Icons.indeterminate_check_box
