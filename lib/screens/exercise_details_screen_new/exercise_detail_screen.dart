import 'package:CaptainSayedApp/models/routine_exercise_model.dart';
import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/circular_timer.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/other_ways_to_exercise.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/bottom_containder.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/screen_widgets/complete_exercise_button.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/exercise_description.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/exercise_video.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/next_info.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/target_muscles.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/title_and_rep_text.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/user_action_button.dart';
import 'package:CaptainSayedApp/screens/finesh_workout_screen.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/rest_between_round_screen.dart';
import 'package:CaptainSayedApp/screens/timer_screen/timer_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';
import 'package:provider/provider.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final int exerciseIndex;
  final RoutineModel routineData;
  final List<RoutineExerciseModel> allExercises;

  const ExerciseDetailScreen({
    Key key,
    this.exerciseIndex,
    this.allExercises,
    this.routineData,
  }) : super(key: key);

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  final _controller = PageController(initialPage: 0);
  int _videoIndex = 0;
  List<Map<String, dynamic>> _allVideos = [];
  List<String> _allImages = [];

  void showOtherVideo(int index) {
    _videoIndex = index;
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  final _meeduPlayerController = MeeduPlayerController(
      colorTheme: Color(0xFFEE6F57),
      controlsStyle: ControlsStyle.primary,
      // pipEnabled: false,
      screenManager: ScreenManager(forceLandScapeInFullscreen: false));

  @override
  void initState() {
    // TODO: implement initState
    _allVideos.add({
      "download_link": widget.allExercises[widget.exerciseIndex].main_video
    });
    _allVideos.addAll(widget.allExercises[widget.exerciseIndex].videos);
    _allImages.add(widget.allExercises[widget.exerciseIndex].main_img);
    _allImages.addAll(widget.allExercises[widget.exerciseIndex].images ?? []);
    super.initState();
  }

  @override
  void dispose() {
    _meeduPlayerController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastExercise =
        widget.exerciseIndex == widget.allExercises.length - 1;
    final hasDuration =
        widget.allExercises[widget.exerciseIndex].exercise_duration != null &&
            widget.allExercises[widget.exerciseIndex].exercise_duration != "0";
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Theme.of(context).primaryColor,
                ),
                color: Colors.black,
              ),
            ),
            TitleRepText(
              exerciseName: widget.allExercises[widget.exerciseIndex].title,
              hasDuration: hasDuration,
              repetitionText: hasDuration
                  ? widget.allExercises[widget.exerciseIndex].exercise_duration
                  : widget.allExercises[widget.exerciseIndex].reps,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              child: PageView(
                children: [
                  ..._allVideos
                      .map(
                        (video) => ExerciseVideo(
                          videoUrl: video["download_link"],
                          controller: _meeduPlayerController,
                        ),
                      )
                      .toList()
                ],
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            // SizedBox(height: SizeConfig.safeBlockVertical),
            Expanded(
              //flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserActionButtons(
                      img: widget.allExercises[widget.exerciseIndex].main_img,
                      exerciseId: widget.allExercises[widget.exerciseIndex].id,
                      exerciseTitle:
                          widget.allExercises[widget.exerciseIndex].title,
                      videoUrl: _allVideos[_videoIndex]["download_link"],
                      isFromProgram: false,
                      exerciseInfo: hasDuration
                          ? "${widget.allExercises[widget.exerciseIndex].exercise_duration} Sec"
                          : "${widget.allExercises[widget.exerciseIndex].reps} Reps",
                    ),
                    Divider(color: Colors.black, thickness: 1),
                    //  SizedBox(height: SizeConfig.safeBlockVertical),
                    Text("Other ways to exercise"),
                    Text("طرق أخرى للتمرين"),
                    // ToDo
                    OhterWaysToExercise(
                      showOtherVideo: showOtherVideo,
                      images: _allImages,
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 4),
                    DescriptionText(
                      widget.allExercises[widget.exerciseIndex].description,
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 3),

                    TargetMuscles(
                      targetMuscles:
                          widget.allExercises[widget.exerciseIndex].muscle,
                    ),

                    SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  ],
                ),
              ),
            ),
            BottomContainer(
              bottomContainerChildren: [
                NextInfo(
                  next: widget.exerciseIndex == widget.allExercises.length - 1
                      ? null
                      : widget.allExercises[widget.exerciseIndex + 1],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.blockSizeVertical * 1.5,
                    top: hasDuration ? 0 : SizeConfig.blockSizeVertical * 1.5,
                  ),
                  child: hasDuration
                      ? CircularTimer(
                          exerciseDuration: widget
                              .allExercises[widget.exerciseIndex]
                              .exercise_duration,
                          afterCompleteExercise: () {
                            _completeExercise(isLastExercise: isLastExercise);
                          },
                        )
                      : CompleteExerciseButton(() {
                          _completeExercise(isLastExercise: isLastExercise);
                        }),
                ),
              ],
            )
          ],
        ),
        height: SizeConfig.screenHeight,
        width: SizeConfig.safeBlockHorizontal * 100,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }

  void _completeExercise({bool isLastExercise}) {
    _meeduPlayerController.pause();
    final p = Provider.of<Prog>(context, listen: false);
    final currentRound = p.getProgress;
    //return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => isLastExercise
            ? (currentRound.toString() == widget.routineData.rounds
                ? FineshWorkoutScreen()
                : RestBetweenRoundsScreen(
                    isComingFromExercisesNotProgram: true,
                    nextRoundNum: currentRound + 1,
                    routineNavFun: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExerciseDetailScreen(
                              allExercises: widget.allExercises,
                              exerciseIndex: 0,
                              routineData: widget.routineData,
                            ),
                          ));
                    },
                  ))
            : TimerScreen(
                totalRest: widget.allExercises[widget.exerciseIndex].rest,
                allExercises: widget.allExercises,
                nextIndex: widget.exerciseIndex + 1,
                routineData: widget.routineData,
              ),
      ),
    );
    if (isLastExercise) {
      p.updateRoutineProgress(
        routineId: widget.routineData.id.toString(),
        routineRep: int.parse(widget.routineData.rounds),
        token: Provider.of<UserData>(context, listen: false).userToken,
      );
    }
  }
}
