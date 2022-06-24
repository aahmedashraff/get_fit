import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  final String counter;
  final int nextRoundNum;
  final bool isComingFromNormalExercises;
  Texts(
      {this.counter,
      this.nextRoundNum,
      this.isComingFromNormalExercises = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Spacer(flex: 3),
          Text(
            counter,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.safeBlockVertical * 12,
            ),
          ),
          Text(
            "Seconds\n",
            style: TextStyle(fontSize: SizeConfig.safeBlockVertical * 6),
          ),
          Flexible(
            child: Row(
              children: [
                Text(
                  "Get Ready For ",
                  style:
                      TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5),
                ),
                Text(
                  nextRoundNum == null && !isComingFromNormalExercises
                      ? "Next Sequence"
                      : (nextRoundNum == null
                          ? "Next Round"
                          : "Round $nextRoundNum"), //: "Round $nextRoundNum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockVertical * 2.5,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
