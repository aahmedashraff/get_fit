import 'package:CaptainSayedApp/models/program_exercise_model.dart';
import 'package:CaptainSayedApp/repos/program_navigation_controller_fun.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/day_exercise_screen_new/day_exercise_detail_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercise_screen_new/widgets/info.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/round_info.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/next_button.dart';
import 'package:CaptainSayedApp/screens/program_screen/screen_widgets/program_image.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllExercisesInDayScreen extends StatelessWidget {
  final String programName;
  final String programImage;
  final String weekId;
  final String dayId;
  final String programId;

  AllExercisesInDayScreen({
    Key key,
    this.programName,
    this.dayId,
    this.programId,
    this.weekId,
    this.programImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Prog>(
          builder: (_, p, __) =>
              FutureBuilder<Map<String, List<ProgramExerciseModel>>>(
            future: getDayExercises(
              dayId: dayId,
              weekId: weekId,
              programId: programId,
            ),
            builder: (ctx, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting ||
                  snapShot.hasError) {
                return Center(child: CircularProgressIndicator());
              }
              Function navigationFun;

              final seqWithExercises = snapShot.data;
              final sequencesInfo = snapShot.data.keys.toList();
              List<ProgramExerciseModel> allDayExercisesWithThierSeqRep = [];
              int currentExerciseIndex = 0;

              for (final seqInfo in sequencesInfo) {
                for (var i = 0; i < int.parse(seqInfo.split("&")[1]); i++) {
                  allDayExercisesWithThierSeqRep
                      .addAll(seqWithExercises[seqInfo]);
                }
              }
              final daysData = p.getDaysData;
              var progress = daysData["Week $weekId"][int.parse(dayId) - 1][0];

              if (!(progress is bool) && progress != "0") {
                var i = 0;

                while ((i / allDayExercisesWithThierSeqRep.length * 100)
                        .toStringAsFixed(3) !=
                    double.parse(progress).toStringAsFixed(3)) {
                  i++;
                }
                currentExerciseIndex = i;
                p.updateIndex(currentExerciseIndex);
              }

              navigationFun = () => determineRestPageToNavigate(
                    context: context,
                    allExercises: allDayExercisesWithThierSeqRep,
                    // currentIndex: currentExerciseIndex,
                    seqWithExercises: seqWithExercises,
                    sequencesInfo: sequencesInfo,
                    dayId: dayId,
                    programId: programId,
                    weekId: weekId,
                  );

              return Stack(
                children: [
                  ListView(
                    children: [
                      ProgramImage(
                        programName: programName,
                        isForProgramInfo: false,
                        imageUrl: programImage,
                      ),
                      ...sequencesInfo.map((seqInfo) {
                        return Column(
                          children: [
                            if (!seqInfo.contains("warm"))
                              RoundInfo(
                                roundTitle:
                                    "Sequence ${sequencesInfo.indexOf(seqInfo)}",
                                roundRep: " ${seqInfo.split("&")[1]} Times",
                              ),
                            ...seqWithExercises[seqInfo].map((exercise) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 3,
                                  vertical: SizeConfig.safeBlockVertical * 2,
                                ),
                                child: GestureDetector(
                                  child: ExerciseInfo(exercise),
                                  onTap: () {
                                    print(exercise.images);
                                    print(";;;;;;;;;;;;;;;;;;;");
                                    print(seqWithExercises[seqInfo]
                                        .indexOf(exercise));
                                    // return;
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (_) => DayExerciseDetailScreen(
                                        isJustToShow: true,
                                        thisExercise: exercise,
                                        allExercises:
                                            allDayExercisesWithThierSeqRep,
                                        exerciseIndex: seqWithExercises[seqInfo]
                                            .indexOf(exercise),
                                        // navFunc: navigationFun,
                                      ),
                                    ));
                                  },
                                ),
                              );
                            }).toList()
                          ],
                        );
                      }).toList(),
                      SizedBox(height: SizeConfig.safeBlockVertical * 8),
                    ],
                  ),
                  StartButton(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => DayExerciseDetailScreen(
                        isJustToShow: false,
                        allExercises: allDayExercisesWithThierSeqRep,
                        exerciseIndex: currentExerciseIndex,
                        navFunc: navigationFun,
                      ),
                    ));
                  })
                ],
              );
            },
          ),
        ),
        backgroundColor: Color(0xFFE9E9E9));
  }
}
