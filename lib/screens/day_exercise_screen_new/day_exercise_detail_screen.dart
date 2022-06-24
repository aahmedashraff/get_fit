import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/models/program_exercise_model.dart';
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
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';
import 'package:provider/provider.dart';

class DayExerciseDetailScreen extends StatefulWidget {
  final bool isFromFav;
  final int exerciseIndex;
  final bool isJustToShow;
  final ProgramExerciseModel thisExercise;
  // final ProgramModel routineData;
  final List<ProgramExerciseModel> allExercises;
  final Function navFunc;

  const DayExerciseDetailScreen(
      {Key key,
      this.exerciseIndex,
      this.thisExercise,
      this.isJustToShow,
      this.allExercises,
      this.isFromFav,
      this.navFunc
      // this.routineData,
      })
      : super(key: key);

  @override
  _DayExerciseDetailScreenState createState() =>
      _DayExerciseDetailScreenState();
}

class _DayExerciseDetailScreenState extends State<DayExerciseDetailScreen> {
  var _isClickedForOneTime = false;
  var currentVideoIndex = 0;
  ProgramExerciseModel exercise;
  List<Map<String, dynamic>> _allVideos = [];
  List<String> _allImages = [];
  final _controller = PageController(initialPage: 0);
  void showOtherVideo(int index) {
    currentVideoIndex = index;
    _controller.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  final _meeduPlayerController = MeeduPlayerController(
    colorTheme: Color(0xFFEE6F57),
    controlsStyle: ControlsStyle.primary,
    pipEnabled: false,
    screenManager: ScreenManager(forceLandScapeInFullscreen: false),
  );

  @override
  void initState() {
    // TODO: implement initState

    exercise = widget.thisExercise == null
        ? widget.allExercises[widget.exerciseIndex]
        : widget.thisExercise;
    _allVideos.add({
      "download_link": exercise.main_video
    });
    _allVideos.addAll(exercise.videos);
    _allImages.add(exercise.main_img);
    print(exercise.toJson());
    print("fffffffffffffffffffffffffff");
    _allImages.addAll(exercise.images??[]);
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
        exercise.exercise_duration != null && exercise.exercise_duration != "0";
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(AppIcon.back),
                color: Colors.black,
              ),
            ),
            TitleRepText(
              exerciseName: exercise.title,
              hasDuration: hasDuration,
              repetitionText:
                  hasDuration ? exercise.exercise_duration : exercise.reps,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              child: PageView(
                children: [
                  ..._allVideos
                      .map(
                        (video) => ExerciseVideo(
                          videoUrl: video["download_link"],
                          // controller: _meeduPlayerController,
                        ),
                      )
                      .toList()
                ],
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical),
            Expanded(
              //flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserActionButtons(
                      img: exercise.main_img,
                      exerciseId: exercise.id,
                      programId: exercise.program_id,
                      exerciseTitle: exercise.title,
                      videoUrl: _allVideos[currentVideoIndex]["download_link"],
                      isFromProgram: true,
                      exerciseInfo: hasDuration
                          ? "${exercise.exercise_duration} Sec"
                          : "${exercise.reps} Reps",
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
                      exercise.description,
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 3),

                    if (exercise.muscle != null)
                      TargetMuscles(
                        targetMuscles: exercise.muscle,
                      ),

                    SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  ],
                ),
              ),
            ),
            if (!widget.isJustToShow)
              BottomContainer(
                bottomContainerChildren: [
                  NextInfo(
                    next: widget.exerciseIndex == widget.allExercises.length - 1
                        ? null
                        : widget.allExercises[widget.exerciseIndex + 1],
                  ),
                  if (!widget.isJustToShow)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 1.5,
                        top: hasDuration
                            ? 0
                            : SizeConfig.blockSizeVertical * 1.5,
                      ),
                      child: hasDuration
                          ? CircularTimer(
                              exerciseDuration: widget
                                  .allExercises[widget.exerciseIndex]
                                  .exercise_duration,
                              afterCompleteExercise: () {
                                _completeExercise(
                                    isLastExercise: isLastExercise);
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

  Future<void> _completeExercise({bool isLastExercise}) async {
    // _meeduPlayerController.pause();
    if (!_isClickedForOneTime) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        await widget.navFunc();
        final int currentIndex = widget.exerciseIndex;
        Provider.of<Prog>(context, listen: false).updateIndex(
            currentIndex + 1 == widget.allExercises.length - 1
                ? 0
                : currentIndex + 1);

        print("fdkdjfdkjkjdfkjdf");
      } on Exception {
        showDialogMessage(
            context: context,
            message: "Please check your connection and try later",
            title: "An Error");
      }
      setState(() {
        _isClickedForOneTime = true;
      });
    }
  }
}
