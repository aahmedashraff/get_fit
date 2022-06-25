import 'dart:async';

import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/program_progress.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/day_exercises_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/details_for_exercise_in_program.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/screen_widgets/program_timer_container.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/plus_and_minus_button.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/skip_button.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramTimerScreen extends StatefulWidget {
  static const screenName = "/program-timer-screen";

  @override
  _ProgramTimerScreenState createState() => _ProgramTimerScreenState();
}

class _ProgramTimerScreenState extends State<ProgramTimerScreen> {
  var programName;
  var dayNumber;
  var weekNumber;

  Timer _timer;
  double _factor = 0.0;
  int _counter;
  var _rest;
  @override
  void initState() {
    super.initState();

    programName =
        Provider.of<UserData>(context, listen: false).getCurrentProgramName;
    dayNumber =
        Provider.of<UserData>(context, listen: false).getCurrentProgramDayNum;
    weekNumber =
        Provider.of<UserData>(context, listen: false).getCurrentProgramWeekNum;

    Future.delayed(Duration.zero, () async {
      await getRest(context);
      print(_counter);
      _startTimer();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          _factor = 1 - (_counter / _rest);
        } else {
          _timer.cancel();
          _afterRest();
        }
      });
    });
  }

  void _increment() {
    setState(() {
      if (_counter + 5 > _rest) {
        _counter = _rest;
        _factor = 0.0;
        return;
      }
      _timer.cancel();
      _counter += 5;
      _factor = 1 - (_counter / _rest);
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
      _factor = 1 - (_counter / _rest);
      _startTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgramTimerContainer(
                counter: _counter.toString(),
                factor: _factor,
              ),
              Container(
                child: Column(
                  children: [
                    //NextExerciseInfo(_nextExerciseInfo),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical,
                      ),
                      child: Row(
                        children: [
                          PlusAndMinusButton(
                            isPlus: false,
                            onPress: _decrement,
                          ),
                          SkipButton(
                            _afterRest,
                          ),
                          PlusAndMinusButton(
                            isPlus: true,
                            onPress: _increment,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    )
                  ],
                ),
                width: SizeConfig.safeBlockHorizontal * 100,
                decoration: BoxDecoration(
                  color: Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(SizeConfig.safeBlockHorizontal * 5),
                    topRight:
                        Radius.circular(SizeConfig.safeBlockHorizontal * 5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 4,
                      spreadRadius: 4,
                      offset: Offset(0, -SizeConfig.safeBlockVertical * .25),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.black,
            ),
            top: MediaQuery.of(context).padding.top,
            left: SizeConfig.safeBlockHorizontal * 2,
          ),
        ],
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }

  Future<void> getRest(BuildContext context) async {
    String _totalRest;
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
    //final roundsInDay = dayData.keys.toList();
    final allExercisesInRound = List<Map<String, dynamic>>.from(
        dayData[currentRound]["round exercises"]);
    final indexOfExercise =
        finishedExerciseInRound % allExercisesInRound.length;
    final exercisesNumXroundRep = allExercisesInRound.length *
        int.parse(dayData[currentRound]["round repetition"]);

    if (currentRound == "round 0") {
      _totalRest = "20";
    } else if (indexOfExercise == allExercisesInRound.length - 1 &&
        finishedExerciseInRound == exercisesNumXroundRep) {
      _totalRest = dayData[currentRound]["round rest"];
    } else {
      _totalRest =
          dayData[currentRound]["round exercises"][indexOfExercise]["rest"];
    }
    if (_totalRest == "minimum") {
      _totalRest = "10";
    }
    _counter = int.parse(_totalRest) + 1;
    _rest = int.parse(_totalRest);
    return _totalRest;
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
      ProgramProgress.setDayRound(
        dayNumber: dayNumber,
        weekNumber: weekNumber,
        programName: programName,
        round: "round 1",
      );

      await Provider.of<ProgramProgress>(context, listen: false)
          .setDayTotalExercisesFinshid(
        dayNumber: dayNumber,
        weekNumber: weekNumber,
        programName: programName,
        finshiedNum: 1,
      );
      Provider.of<ProgramProgress>(context, listen: false)
          .updateProgramTotalProgress(
        programName,
        dayNumber,
        weekNumber,
      );
      await ProgramProgress.setRoundFinishedExercisesNum(
        dayNumber: dayNumber,
        weekNumber: weekNumber,
        programName: programName,
        roundFinishedExercisesNum: 0,
      );
    } else {
      await Provider.of<ProgramProgress>(context, listen: false)
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

      await ProgramProgress.setRoundFinishedExercisesNum(
        dayNumber: dayNumber,
        weekNumber: weekNumber,
        programName: programName,
      );
    }
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
