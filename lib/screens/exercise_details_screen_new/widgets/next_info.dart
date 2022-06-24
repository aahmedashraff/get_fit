import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class NextInfo extends StatelessWidget {
  final dynamic next;

  const NextInfo({Key key, this.next}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool hasDuration;
    if (next != null)
      hasDuration =
          next.exercise_duration != null && next.exercise_duration != "0";
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
              next == null ? "Exercises Finished" : "Next",
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
          child: next == null
              ? null
              : Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 2),
                      child: Image.network(
                        "$imageBase_URL/${next.main_img}",
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
                              text: "${next.title}\n",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                              ),
                              children: [
                                TextSpan(
                                  text: hasDuration
                                      ? next.exercise_duration
                                      : next.reps,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5.5,
                                  ),
                                ),
                                TextSpan(
                                  text: hasDuration ? " sec" : " Reps",
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
