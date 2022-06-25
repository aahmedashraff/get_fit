import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/bottom_containder.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/complete_exercise_button.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/details_of_exercise.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/next_exerise_info.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/repetition_text.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/video_container.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/exercise_screen.dart';
import 'package:CaptainSayedApp/screens/finesh_workout_screen.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/rest_between_round_screen.dart';
import 'package:CaptainSayedApp/screens/timer_screen/timer_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  static const screenName = "/exercise-details-screen";

  @override
  _ExerciseDetailsScreenState createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  // YoutubePlayerController _controller;

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _controller.dispose();

  // }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final List categoryExercises = arguments["category-exercises"];
    final int exerciseIndex = arguments["exercise-index"];
    final Map<String, dynamic> exerciseInfo = categoryExercises[exerciseIndex];
    final Map<String, dynamic> nextExerciseInfo =
        exerciseIndex == categoryExercises.length - 1
            ? null
            : categoryExercises[exerciseIndex + 1];
    //if it's the final exercise in category
    //return null else return the map of this
    //next exercise
    // _controller = YoutubePlayerController(
    //   initialVideoId: exerciseInfo["video"],
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: true,
    //     loop: true,
    //   ),
    // );
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context)
                      .popUntil(ModalRoute.withName(ExerciseScreen.screenName)),
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              VideoContainer(exerciseInfo["video"]),
              Spacer(flex: 1),
              Text(
                exerciseInfo["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                ),
              ),
              Spacer(flex: 1),
              RepetitionText(exerciseInfo["repetition"]),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Spacer(flex: 4),
              DetailsOfExercise(
                exerciseInfo["arabic-details"],
                exerciseInfo["english-details"],
              ),
              Spacer(flex: 6),
              BottomContainer(
                bottomContainerChildren: [
                  NextExerciseInfo(nextExerciseInfo),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 8,
                      vertical: SizeConfig.blockSizeVertical * 1.5,
                    ),
                    child: CompleteExerciseButton(
                      () => _afterfinishExercise(
                        categoryExercises: categoryExercises,
                        exerciseIndex: exerciseIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: SizeConfig.screenHeight,
          width: SizeConfig.safeBlockHorizontal * 100,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ),
        backgroundColor: Color(0xFFE9E9E9));
  }

  Future<void> _afterfinishExercise(
      {int exerciseIndex, List categoryExercises}) async {
    if (exerciseIndex == categoryExercises.length - 1) {
      // if it is last exercise in round
      final name =
          Provider.of<UserData>(context, listen: false).getCurrentExerciseName;

      final exerciseRound = await UserData.getExerciseRound(name);
      print(exerciseRound);
      exerciseRound != null && exerciseRound == 4
          // if it also last round
          ? Navigator.of(context).pushNamedAndRemoveUntil(
              FineshWorkoutScreen.screenName,
              ModalRoute.withName(ExerciseScreen.screenName),
            )
          : Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RestBetweenRoundsScreen(
                  isComingFromExercisesNotProgram: true,
                  detailsForFirstExerciseInNextRound: {
                    "category-exercises": categoryExercises,
                    "exercise-index": 0
                  },
                  nextRoundNum: exerciseRound == null ? 2 : exerciseRound + 1,
                ),
              ),
              ModalRoute.withName(ExerciseScreen.screenName),
            );
      await Provider.of<UserData>(context, listen: false)
          .setExerciseRound(name);
    } else
      Navigator.of(context).pushNamed(TimerScreen.screenName, arguments: {
        "categoryExercisesList": categoryExercises,
        "exerciseIndex": exerciseIndex
      });
  }
}
