import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  final Function openDrawer;
  DrawerIcon(this.openDrawer);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FlatButton(padding: EdgeInsets.only(
      top: SizeConfig.safeBlockVertical,
    ) ,
        onPressed: openDrawer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.safeBlockHorizontal * 12,
              height: SizeConfig.safeBlockVertical * .75,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                // borderRadius:
                //     BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
              margin:
                  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * .4),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 8,
              height: SizeConfig.safeBlockVertical * .75,
              decoration: BoxDecoration(
                color: Colors.black,
                // borderRadius:
                //     BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
              margin:
                  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * .4),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 4,
              height: SizeConfig.safeBlockVertical * .75,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                // borderRadius:
                //     BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
