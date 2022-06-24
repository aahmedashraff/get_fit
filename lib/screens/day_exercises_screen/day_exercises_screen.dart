import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/program_progress.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/details_for_exercise_in_program.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/exercise_info.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/round_info.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/next_button.dart';
import 'package:CaptainSayedApp/screens/program_screen/screen_widgets/program_image.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayExercisesScreen extends StatelessWidget {
  static const screenName = "/day-exercises-screen";
  @override
  Widget build(BuildContext context) {
    final programName = Provider.of<UserData>(context).getCurrentProgramName;
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final int weekNumber = arguments["week-number"];
    final int dayNumber = arguments["day-number"];

    return Scaffold(
        body: FutureBuilder(
            future: AppData.getAllProgramsData(
                weekNumber - 1, programName, context),
            builder: (_, AsyncSnapshot<Map> snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final dayData = Map<String, Map<String, dynamic>>.from(
                  snapShot.data["day $dayNumber"]);
              //final  n =List<Map<String,dynamic>>.from(dayData["round 0"]["round exercises"]) ;
              final roundsInDay = dayData.keys.toList();

              print(roundsInDay);
              return Stack(
                children: [
                  ListView(
                    children: [
                      ProgramImage(
                        programName: programName,
                        isForProgramInfo: false,
                      ),
                      ...roundsInDay.map((round) {
                        final allExercisesInRound =
                            List<Map<String, dynamic>>.from(
                                dayData[round]["round exercises"]);
                        return Column(
                          children: [
                            if (round != "round 0")
                              RoundInfo(
                                roundTitle:
                                    "Sequence ${roundsInDay.indexOf(round)}",
                                roundRep:
                                    " ${dayData[round]["round repetition"]} Times",
                              ),
                            ...allExercisesInRound
                                .map((exercise) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.safeBlockHorizontal * 3,
                                        vertical:
                                            SizeConfig.safeBlockVertical * 2,
                                      ),
                                      child: GestureDetector(
                                        child: ExerciseInfo(exercise),
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            DetailsForExerciseInDayScreen
                                                .screenName,
                                            arguments: {
                                              "round-exercises":
                                                  allExercisesInRound,
                                              "exercise-index":
                                                  allExercisesInRound
                                                      .indexOf(exercise),
                                              "is-jsut-show-exercise": true
                                            },
                                          );
                                        },
                                      ),
                                    ))
                                .toList()
                          ],
                        );
                      }).toList(),
                      SizedBox(height: SizeConfig.safeBlockVertical * 8),
                    ],
                  ),
                  StartButton(() async {
                    String currentRound = await ProgramProgress.getCurrentRound(
                      dayNumber: dayNumber,
                      weekNumber: weekNumber,
                      programName: programName,
                    );
                    int finishedExerciseInRound =
                        await ProgramProgress.getRoundFinishedExercisesNum(
                      dayNumber: dayNumber,
                      weekNumber: weekNumber,
                      programName: programName,
                    );
                    final allExercisesInRound = List<Map<String, dynamic>>.from(
                        dayData[currentRound]["round exercises"]);

                    Navigator.of(context).pushNamed(
                      DetailsForExerciseInDayScreen.screenName,
                      arguments: {
                        "round-exercises": allExercisesInRound,
                        "exercise-index": finishedExerciseInRound %
                            allExercisesInRound.length,
                      },
                    );

                    // if (finishedExerciseInRound ==
                    //     dayData[currentRound]["round exercises"].length *
                    //         int.parse(
                    //             dayData[currentRound]["round repetition"])) {
                    //   ProgramProgress.setRoundFinishedExercisesNum(
                    //       dayNumber: dayNumber,
                    //       weekNumber: weekNumber,
                    //       programName: programName,
                    //       roundFinishedExercisesNum: 0);
                    //   if (currentRound.compareTo(roundsInDay.last) == 0) {
                    //     ProgramProgress.setDayCurrentRound(
                    //       currentRound: "round 0",
                    //       dayNumber: dayNumber,
                    //       weekNumber: weekNumber,
                    //       programName: programName,
                    //     );
                    //   } else {
                    //     ProgramProgress.setDayCurrentRound(
                    //         dayNumber: dayNumber,
                    //         weekNumber: weekNumber,
                    //         programName: programName,
                    //         currentRound: roundsInDay[
                    //             roundsInDay.indexOf(currentRound) + 1]);
                    //   }
                    // }
                  })
                ],
              );
            }),
        backgroundColor: Color(0xFFE9E9E9));
  }
}
