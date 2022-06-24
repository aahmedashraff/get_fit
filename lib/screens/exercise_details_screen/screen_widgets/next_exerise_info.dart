import 'package:flutter/material.dart';

import '../../../sizeConfig.dart';

class NextExerciseInfo extends StatelessWidget {
  final dynamic nextExerciseInfo;
  NextExerciseInfo(this.nextExerciseInfo);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
          width: SizeConfig.safeBlockHorizontal * 10,
          height: SizeConfig.safeBlockVertical * .7,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 3),
          ),
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 3,
            ),
            child: Text(
              nextExerciseInfo == null ? "Exercises Finished" : "Next",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 3,
            vertical: SizeConfig.safeBlockVertical * .5,
          ),
          child: nextExerciseInfo == null
              ? null
              : Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 2),
                      child: Image.network(
                        nextExerciseInfo.images[0],
                        width: SizeConfig.safeBlockHorizontal * 35,
                        height: SizeConfig.safeBlockVertical * 7,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 5),
                        child: FittedBox(
                          child: RichText(
                            text: TextSpan(
                              text: "${nextExerciseInfo.title}\n",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                              ),
                              children: [
                                TextSpan(
                                  text: nextExerciseInfo.reps == null ||
                                          nextExerciseInfo.reps == "0"
                                      ? "${nextExerciseInfo.exercise_duration}"
                                      : "${nextExerciseInfo.reps}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5.5,
                                  ),
                                ),
                                TextSpan(
                                  text: nextExerciseInfo.reps == null ||
                                          nextExerciseInfo.reps == "0"
                                      ? " Sec"
                                      : " Reps",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
