import 'dart:async';

import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/program_progress.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/day_exercises_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/details_for_exercise_in_program.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/screen_widgets/clored_background.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/screen_widgets/texts.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/plus_and_minus_button.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/skip_button.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramRestBetweenRoundsScreen extends StatefulWidget {
  static const screenName = "/program-rest-between-rounds";
  final String totalRest;
  //final bool isLastRepetitionInRound;
  final int nextRoundNum;

  const ProgramRestBetweenRoundsScreen({
    this.totalRest,
    this.nextRoundNum,
    //this.isLastRepetitionInRound,
  });

  @override
  _ProgramRestBetweenRoundsScreenState createState() =>
      _ProgramRestBetweenRoundsScreenState();
}

class _ProgramRestBetweenRoundsScreenState
    extends State<ProgramRestBetweenRoundsScreen> {
  var programName;
  var dayNumber;
  var weekNumber;

  int _counter;
  var _factor = 0.0;
  Timer _timer;
  int totalRest;

  @override
  void initState() {
    programName =
        Provider.of<UserData>(context, listen: false).getCurrentProgramName;
    dayNumber =
        Provider.of<UserData>(context, listen: false).getCurrentProgramDayNum;
    weekNumber =
        Provider.of<UserData>(context, listen: false).getCurrentProgramWeekNum;

    if (widget.totalRest == "minimum") {
      _counter = 10;
      totalRest = _counter;
    } else {
      _counter = int.parse(widget.totalRest);
      totalRest = _counter;
    }
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
          _factor = 1 -
              (_counter /
                  int.parse(
                      widget.totalRest == "minimum" ? "10" : widget.totalRest));
        });
      } else {
        _timer.cancel();
        _afterRest();
        //Navigator.of(context).pop();
      }
    });
  }

  void _increment() {
    setState(() {
      if (_counter + 5 > totalRest) {
        _counter = totalRest;
        _factor = 0.0;
        return;
      }
      _timer.cancel();
      _counter += 5;
      _factor = 1 -
          (_counter /
              int.parse(
                  widget.totalRest == "minimum" ? "10" : widget.totalRest));
      _startTimer();
    });
  }

  void _decrement() {
    setState(() {
      if (_counter - 5 < 0) {
        _counter = 0;
        _factor = 1.0;
        return;
      }
      _timer.cancel();
      _counter -= 5;
      _factor = 1 -
          (_counter /
              int.parse(
                  widget.totalRest == "minimum" ? "10" : widget.totalRest));
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ColoredBackGround(),
            FractionallySizedBox(
              heightFactor: _factor,
              child: Container(
                color: Colors.white,
              ),
            ),
            Texts(
              counter: _counter == null ? "Rest" : "$_counter",
              nextRoundNum: widget.nextRoundNum,
            ),
            Positioned(
              child: Row(children: [
                PlusAndMinusButton(
                  isPlus: false,
                  onPress: _decrement,
                ),
                SkipButton(() {
                  _timer.cancel();
                  _afterRest();
                  //Navigator.of(context).pop();
                }),
                PlusAndMinusButton(
                  isPlus: true,
                  onPress: _increment,
                ),
              ]),
              bottom: MediaQuery.of(context).padding.top,
              left: SizeConfig.safeBlockHorizontal * 10.5,
            )
          ],
        ),
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 100,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      ),
    );
  }

  Future<void> _afterRest() async {
    // ProgramProgress.setDayCurrentRound()
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
    if (currentRound == "round 0") {
      // if last round and last repition in round
    } else {}
    currentRound = await ProgramProgress.getCurrentRound(
      dayNumber: dayNumber,
      weekNumber: weekNumber,
      programName: programName,
    );
    finishedExerciseInRound =
        await ProgramProgress.getRoundFinishedExercisesNum(
      dayNumber: dayNumber,
      weekNumber: weekNumber,
      programName: programName,
    );
    allExercisesInRound = List<Map<String, dynamic>>.from(
        dayData[currentRound]["round exercises"]);

    Future.delayed(Duration(milliseconds: 50), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        DetailsForExerciseInDayScreen.screenName,
        ModalRoute.withName(DayExercisesScreen.screenName),
        arguments: {
          "round-exercises": allExercisesInRound,
          "exercise-index":
              finishedExerciseInRound % allExercisesInRound.length,
        },
      );
    });

    // print(await ProgramProgress.getCurrentRound(
    //   dayNumber: dayNumber,
    //   weekNumber: weekNumber,
    //   programName: programName,
    // ));
    // print(await ProgramProgress.getRoundFinishedExercisesNum(
    //   dayNumber: dayNumber,
    //   weekNumber: weekNumber,
    //   programName: programName,
    // ));
    // print(await ProgramProgress.getDayTotalExercisesFinshid(
    //   dayNumber: dayNumber,
    //   weekNumber: weekNumber,
    //   programName: programName,
    // ));
  }
}
