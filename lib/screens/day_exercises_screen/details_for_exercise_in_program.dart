import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/program_progress.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/day_exercises_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/program_rest_between_round.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/program_timer_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/circular_timer.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/exercise_prog_rep_text.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/other_ways_to_exercise.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/target_muscles.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/bottom_containder.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/complete_exercise_button.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/details_of_exercise.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/next_exerise_info.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/video_container.dart';
import 'package:CaptainSayedApp/screens/finesh_workout_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsForExerciseInDayScreen extends StatefulWidget {
  static const screenName = "/details-for-exercise-in-program";

  @override
  _DetailsForExerciseInDayScreenState createState() =>
      _DetailsForExerciseInDayScreenState();
}

class _DetailsForExerciseInDayScreenState
    extends State<DetailsForExerciseInDayScreen> {
  //YoutubePlayerController _controller;
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final List roundExercises = arguments["round-exercises"];
    final int exerciseIndex = arguments["exercise-index"];
    final Map<String, dynamic> exerciseInfo = roundExercises[exerciseIndex];
    final Map<String, dynamic> nextExerciseInfo =
        exerciseIndex == roundExercises.length - 1
            ? null
            : roundExercises[exerciseIndex + 1];
    var _videos = [exerciseInfo["video"], "SI5O6XgQsUo", "yhnIj_h_-4A"];

    //if it's the final exercise in category
    //return null else return the map of this
    //next exercise

    void showOtherVideo(int index) {
      _controller.animateToPage(
        index,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).popUntil(
                    ModalRoute.withName(DayExercisesScreen.screenName)),
                icon: Icon(AppIcon.back),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 1.75,
                left: SizeConfig.safeBlockHorizontal * 4,
                right: SizeConfig.safeBlockHorizontal * 4,
                bottom: SizeConfig.safeBlockVertical * 1.5,
              ),
              child: Row(
                children: [
                  Text(
                    exerciseInfo["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                    ),
                  ),
                  Spacer(),
                  ExerciseProgramRepText(exerciseInfo["repetition"]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView(
                children: [
                  for (var i = 0; i < _videos.length; i++)
                    Container(
                      child: VideoContainer(_videos[i]),
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.safeBlockVertical * .5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            blurRadius: 4,
                            // spreadRadius: 4,
                            offset:
                                Offset(0, SizeConfig.safeBlockVertical * .25),
                          ),
                        ],
                      ),
                    )
                ],
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical),
            Expanded(
              flex: arguments["is-jsut-show-exercise"] == null ? 2 : 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          child: Column(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: Colors.black,
                              ),
                              Text("Favourite")
                            ],
                          ),

                          //label: Text("Favourite"),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Column(
                            children: [
                              Icon(
                                Icons.list,
                                color: Colors.black,
                              ),
                              Text("Save")
                            ],
                          ),

                          //label: Text("Favourite"),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Column(
                            children: [
                              Icon(
                                AppIcon.cloud_computing,
                                color: Colors.black,
                              ),
                              Text("Download")
                            ],
                          ),

                          //label: Text("Favourite"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 1),
                 //  SizedBox(height: SizeConfig.safeBlockVertical),
                    Text("Other ways to exercise"),
                    Text("طرق أخرى للتمرين"),
                    OhterWaysToExercise(showOtherVideo: showOtherVideo),
                    SizedBox(height: SizeConfig.safeBlockVertical * 4),
                    DetailsOfExercise(
                      exerciseInfo["arabic-details"],
                      exerciseInfo["english-details"],
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 3),
                    TargetMuscles(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  ],
                ),
              ),
            ),
            if (arguments["is-jsut-show-exercise"] == null)
              BottomContainer(
                bottomContainerChildren: [
                  NextExerciseInfo(nextExerciseInfo),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 1.5,
                        top: exerciseInfo["repetition"]
                                .toString()
                                .contains("sec")
                            ? 0
                            : SizeConfig.blockSizeVertical * 1.5),
                    child: exerciseInfo["repetition"].toString().contains("sec")
                        ? CircularTimer(
                            exerciseDuration: exerciseInfo["repetition"],
                            afterCompleteExercise: _afterCompleteExercise,
                          )
                        : CompleteExerciseButton(_afterCompleteExercise),
                  ),
                ],
              ),
          ],
        ),
        height: SizeConfig.screenHeight,
        width: SizeConfig.safeBlockHorizontal * 100,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }

  Future<void> _afterCompleteExercise() async {
    final programName =
        Provider.of<UserData>(context, listen: false).getCurrentProgramName;
    final dayNumber =
        Provider.of<UserData>(context, listen: false).getCurrentProgramDayNum;
    final weekNumber =
        Provider.of<UserData>(context, listen: false).getCurrentProgramWeekNum;
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

    final data =
        await AppData.getAllProgramsData(weekNumber - 1, programName, context);

    final dayData =
        Map<String, Map<String, dynamic>>.from(data["day $dayNumber"]);
    final roundsInDay = dayData.keys.toList();
    var allExercisesInRound = List<Map<String, dynamic>>.from(
        dayData[currentRound]["round exercises"]);

    final indexOfExercise =
        finishedExerciseInRound % allExercisesInRound.length;

    final exercisesNumXroundRep = allExercisesInRound.length *
        int.parse(dayData[currentRound]["round repetition"]);

    // if it's not round zero
    if (currentRound != "round 0") {
      // if it's last exercise and last round (Day is finished)
      if (finishedExerciseInRound == exercisesNumXroundRep - 1 &&
          currentRound.compareTo(roundsInDay.last) == 0) {
        ProgramProgress.setDayRound(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
          round: "round 0",
        );
        Provider.of<ProgramProgress>(context, listen: false)
            .updateProgramTotalProgress(
          programName,
          dayNumber,
          weekNumber,
        );
        ProgramProgress.setIsUserFinishDayForOneTime(
          dayNum: dayNumber,
          progName: programName,
          weekNum: weekNumber,
        );

        Provider.of<ProgramProgress>(context, listen: false)
            .setDayTotalExercisesFinshid(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
          finshiedNum: 0,
        );
        ProgramProgress.setRoundFinishedExercisesNum(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
          roundFinishedExercisesNum: 0,
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (_) => FineshWorkoutScreen(),
              // ProgramRestBetweenRoundsScreen(
              //       totalRest: dayData[currentRound]["round rest"],
              //     ),
              settings: RouteSettings()),
          ModalRoute.withName(DayExercisesScreen.screenName),
        );
        return;
      }

      // if round finished and it is not last round in the day
      else if (finishedExerciseInRound == exercisesNumXroundRep - 1 &&
          currentRound.compareTo(roundsInDay.last) != 0) {
        ProgramProgress.setDayRound(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
          round: roundsInDay[roundsInDay.indexOf(currentRound) + 1],
        );
        ProgramProgress.setRoundFinishedExercisesNum(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
          roundFinishedExercisesNum: 0,
        );
        Provider.of<ProgramProgress>(context, listen: false)
            .setDayTotalExercisesFinshid(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
        );
        Provider.of<ProgramProgress>(context, listen: false)
            .updateProgramTotalProgress(
          programName,
          dayNumber,
          weekNumber,
        );

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => ProgramRestBetweenRoundsScreen(
              totalRest: dayData[currentRound]["round rest"],
            ),
          ),
          ModalRoute.withName(DayExercisesScreen.screenName),
        );
        return;
      } else if (indexOfExercise == allExercisesInRound.length - 1) {
        //last exercise but round doesn't finish
        final numOfCurrentRepetition =
            finishedExerciseInRound ~/ allExercisesInRound.length;
        ProgramProgress.setRoundFinishedExercisesNum(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
        );
        Provider.of<ProgramProgress>(context, listen: false)
            .setDayTotalExercisesFinshid(
          dayNumber: dayNumber,
          weekNumber: weekNumber,
          programName: programName,
        );
        Provider.of<ProgramProgress>(context, listen: false)
            .updateProgramTotalProgress(
          programName,
          dayNumber,
          weekNumber,
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => ProgramRestBetweenRoundsScreen(
              totalRest: dayData[currentRound]["round rest"],
              nextRoundNum: numOfCurrentRepetition + 2,
            ),
          ),
          ModalRoute.withName(DayExercisesScreen.screenName),
        );
        return;
      }
    }
    Navigator.of(context).pushNamed(
      ProgramTimerScreen.screenName,
      // arguments: {
      //   "categoryExercisesList": roundExercises,
      //   "exerciseIndex": exerciseIndex
      // },
    );
  }
}
