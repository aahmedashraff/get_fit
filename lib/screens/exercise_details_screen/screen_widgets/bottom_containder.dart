import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final List<Widget> bottomContainerChildren;
  BottomContainer({@required this.bottomContainerChildren});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: bottomContainerChildren,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      width: SizeConfig.safeBlockHorizontal * 100,
      decoration: BoxDecoration(
        color:  Color(0xFFE9E9E9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 5),
          topRight: Radius.circular(SizeConfig.safeBlockHorizontal * 5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(0, -SizeConfig.safeBlockVertical * .25),
          ),
        ],
      ),
      //height: SizeConfig.safeBlockVertical * 24,
    );
  }
}
