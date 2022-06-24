import 'dart:async';
import 'package:provider/provider.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';

import 'package:CaptainSayedApp/models/program_exercise_model.dart';
import 'package:CaptainSayedApp/screens/day_exercise_screen_new/day_exercise_detail_screen.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/screen_widgets/clored_background.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/screen_widgets/texts.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/plus_and_minus_button.dart';
import 'package:CaptainSayedApp/screens/timer_screen/screen_widgets/skip_button.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class RestBetweenRoundsScreen extends StatefulWidget {
  static const screenName = "/rest-between-rounds";

  final Map<String, dynamic> detailsForFirstExerciseInNextRound;
  final bool isComingFromExercisesNotProgram;
  final int nextRoundNum;
  final Function navFun;
  final List<ProgramExerciseModel> allExercises;
  final int currentIndex;
  final Function routineNavFun;

  const RestBetweenRoundsScreen({
    this.detailsForFirstExerciseInNextRound,
    this.isComingFromExercisesNotProgram,
    this.navFun,
    this.nextRoundNum,
    this.allExercises,
    this.currentIndex,
    this.routineNavFun,
  });

  @override
  _RestBetweenRoundsScreenState createState() =>
      _RestBetweenRoundsScreenState();
}

class _RestBetweenRoundsScreenState extends State<RestBetweenRoundsScreen> {
  int _counter = 90;
  var _factor = 0.0;
  Timer _timer;

  @override
  void initState() {
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
          _factor = 1 - (_counter / 90);
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
      if (_counter + 5 > 90) {
        _counter = 90;
        _factor = 0.0;
        return;
      }
      _timer.cancel();
      _counter += 5;
      _factor = 1 - (_counter / 90);
      _startTimer();
    });
  }

  void _decrement() {
    setState(() {
      if (_counter - 5 < 0) {
        _counter = 0;
        return;
      }
      _timer.cancel();
      _counter -= 5;
      _factor = 1 - (_counter / 90);
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
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
                  counter: "$_counter",
                  isComingFromNormalExercises:
                      widget.isComingFromExercisesNotProgram,
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
          backgroundColor: Color(0xFFE9E9E9)),
    );
  }

  void _afterRest() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    if (widget.routineNavFun != null) {
      widget.routineNavFun();
    }
    if (widget.navFun == null) return;
    print(Provider.of<Prog>(context, listen: false).getCurrentIndex);
    print("0..0.0..0.0.0.0");

    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => DayExerciseDetailScreen(
        isJustToShow: false,
        allExercises: widget.allExercises,
        exerciseIndex:
            Provider.of<Prog>(context, listen: false).getCurrentIndex,
        navFunc: widget.navFun,
      ),
    ));
  }
}
