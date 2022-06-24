import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TimerContainer extends StatelessWidget {
  final String totalRest;
  final String counter;
  final double factor;
  TimerContainer(
      {@required this.totalRest,
      @required this.counter,
      @required this.factor});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF77382C), Theme.of(context).primaryColor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 8),
                bottomRight:
                    Radius.circular(SizeConfig.safeBlockHorizontal * 8),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: factor,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: factor == 1
                    ? BorderRadius.only(
                        bottomLeft:
                            Radius.circular(SizeConfig.safeBlockHorizontal * 8),
                        bottomRight:
                            Radius.circular(SizeConfig.safeBlockHorizontal * 8),
                      )
                    : null,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counter == null.toString() ? totalRest : "$counter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 20,
                  ),
                ),
                Text(
                  "Seconds",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, SizeConfig.safeBlockVertical * .5),
          ),
        ],
      ),
      height:
          SizeConfig.screenHeight * .72 - MediaQuery.of(context).padding.top,
      width: SizeConfig.safeBlockHorizontal * 100,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }
}
