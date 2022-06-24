import 'package:CaptainSayedApp/models/program_exercise_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/screens/finesh_workout_screen.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/rest_between_round_screen.dart';
import 'package:CaptainSayedApp/screens/timer_screen/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> determineRestPageToNavigate({
  BuildContext context,
  GlobalKey<ScaffoldState> key,
  String programId,
  String dayId,
  String weekId,
  List<ProgramExerciseModel> allExercises,
  // int currentIndex,
  Map<String, List<ProgramExerciseModel>> seqWithExercises,
  List<String> sequencesInfo,
}) async {
  // print("1010101010101010101");
  // print(key.currentContext.widget);
  // print(key.currentContext.widget);
  // print(key.currentContext.findAncestorRenderObjectOfType().parent);
  // print(key.currentContext.toString());
  // print("999999999999999999999999999");
  final currentIndex =
      Provider.of<Prog>(context, listen: false).getCurrentIndex;
      
  await Provider.of<Prog>(context, listen: false).updateDayProgress(
    dayId: dayId,
    programId: programId,
    context: context,
    weekId: weekId,
    token: Provider.of<UserData>(context, listen: false).userToken,
  );
  Widget restPage;
  print(currentIndex);
  print("///////////////////////////////////////////////////////");
  if (currentIndex == 0) {
    restPage = TimerScreen(
      allExercises: allExercises,
      nextIndex: currentIndex + 1,
      totalRest: allExercises[currentIndex].rest,
      navFunc: () => determineRestPageToNavigate(
        allExercises: allExercises,
        context: context,
        // currentIndex: currentIndex,
        dayId: dayId,
        programId: programId,
        seqWithExercises: seqWithExercises,
        sequencesInfo: sequencesInfo,
        weekId: weekId,
      ),
    );
  } else {
    int totalFinished = 0;
    for (final seq in sequencesInfo) {
      final seqRep = int.parse(seq.split("&")[1]);

      if (currentIndex - totalFinished + 1 >
          seqRep * seqWithExercises[seq].length) {
        totalFinished += seqRep * seqWithExercises[seq].length;
      }

      //to check if it is last exercise in a sequence
      else if (currentIndex - totalFinished + 1 ==
          seqRep * seqWithExercises[seq].length) {
        print(
            "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss");
        seq == sequencesInfo.last
            ? restPage = FineshWorkoutScreen()
            : restPage = RestBetweenRoundsScreen(
                allExercises: allExercises,
                currentIndex: currentIndex,
                isComingFromExercisesNotProgram: false,
                nextRoundNum: null,
                navFun: () => determineRestPageToNavigate(
                  allExercises: allExercises,
                  context: context,
                  // currentIndex: currentIndex,
                  dayId: dayId,
                  programId: programId,
                  seqWithExercises: seqWithExercises,
                  sequencesInfo: sequencesInfo,
                  weekId: weekId,
                ),
              );
        if (currentIndex == allExercises.length - 1) {
          Provider.of<Prog>(context, listen: false).updateIndex(0);
        }

        break;
      } else {
        print("rrrrrrrrrrrrrrrrrrrrrrrr");
        print(currentIndex - totalFinished + 1);
        print(seqWithExercises[seq].length);
        (currentIndex - totalFinished + 1) % (seqWithExercises[seq].length) == 0
            ? restPage = RestBetweenRoundsScreen(
               allExercises: allExercises,
                currentIndex: currentIndex,
                isComingFromExercisesNotProgram: true,
                navFun: () => determineRestPageToNavigate(
                  allExercises: allExercises,
                  context: context,
                  // currentIndex: currentIndex,
                  dayId: dayId,
                  programId: programId,
                  seqWithExercises: seqWithExercises,
                  sequencesInfo: sequencesInfo,
                  weekId: weekId,
                ),
              )
            : restPage = TimerScreen(
                allExercises: allExercises,
                nextIndex: currentIndex + 1,
                totalRest: allExercises[currentIndex].rest,
                navFunc: () => determineRestPageToNavigate(
                  allExercises: allExercises,
                  context: context,
                  // currentIndex: currentIndex,
                  dayId: dayId,
                  programId: programId,
                  seqWithExercises: seqWithExercises,
                  sequencesInfo: sequencesInfo,
                  weekId: weekId,
                ),
              );
        break;
      }
    }
  }
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) {
      return restPage;
    }),
  );
}
