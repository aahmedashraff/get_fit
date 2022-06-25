import 'dart:async';

import 'package:CaptainSayedApp/models/program_exercise_model.dart';
import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/screens/day_exercise_screen_new/day_exercise_detail_screen.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/exercise_detail_screen.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/widgets/next_info.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/plus_and_minus_button.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/skip_button.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/timer_container.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  static const screenName = "/timer-screen";

  final String totalRest;
  final List<dynamic> allExercises;
  final int nextIndex;
  final RoutineModel routineData;
  final Function navFunc;

  const TimerScreen(
      {Key key,
      this.totalRest,
      this.allExercises,
      this.nextIndex,
      this.routineData,
      this.navFunc})
      : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _counter;
  var _factor = 0.0;
  Timer _timer;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _counter = int.parse(widget.totalRest);
      _startTimer();
    });
    super.initState();
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
                TimerContainer(
                  counter: _counter.toString(),
                  factor: _factor,
                  totalRest: widget.totalRest,
                ),
                Container(
                  child: Column(
                    children: [
                      NextInfo(next: widget.allExercises[widget.nextIndex]),
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
                            SkipButton(() => _afterRest()),
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
        backgroundColor: Color(0xFFE9E9E9));
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          _factor = 1 - _counter / int.parse(widget.totalRest);
        } else {
          _timer.cancel();
          _afterRest();
        }
      });
    });
  }

  void _increment() {
    setState(() {
      if (_counter + 5 > int.parse(widget.totalRest)) {
        _timer.cancel();
        _counter = int.parse(widget.totalRest);
        _factor = 0.0;
        _startTimer();
        return;
      }
      _timer.cancel();
      _counter += 5;
      _factor = 1 - _counter / int.parse(widget.totalRest);
      _startTimer();
    });
  }

  void _decrement() {
    setState(() {
      if (_counter - 5 < 0) {
        _timer.cancel();
        _counter = 0;
        _factor = 1.0;
        _startTimer();
        return;
      }
      _timer.cancel();
      _counter -= 5;
      _factor = 1 - _counter / int.parse(widget.totalRest);
      _startTimer();
    });
  }

  void _afterRest() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Future.delayed(Duration(milliseconds: 150));

    print(widget.allExercises[0] is ProgramExerciseModel);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: widget.allExercises[0] is ProgramExerciseModel
            ? (_) => DayExerciseDetailScreen(
                  allExercises: widget.allExercises,
                  exerciseIndex: widget.nextIndex,
                  navFunc: widget.navFunc,
                  isJustToShow: false,
                )
            : (_) => ExerciseDetailScreen(
                  allExercises: widget.allExercises,
                  exerciseIndex: widget.nextIndex,
                  routineData: widget.routineData,
                ),
      ),
    );
  }
}
