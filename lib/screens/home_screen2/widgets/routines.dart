import 'dart:async';

import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/view_all_routines.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/exercise_type_item.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Routines extends StatefulWidget {
  // static const exercisesTitle = const [
  //   "Chest",
  //   "Back",
  //   "Shoulder",
  //   "Arm",
  //   "Abs",
  //   "Legs",
  // ];

  @override
  _RoutinesState createState() => _RoutinesState();
}

class _RoutinesState extends State<Routines>
    with AutomaticKeepAliveClientMixin {
  List<RoutineModel> _allRoutines;
  var _isLoading = false;
  var _index = 0;
  Timer _timer;
  PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    if (mounted)
      setState(() {
        _isLoading = true;
      });
    getRoutines().then((value) {
      _allRoutines = value;
      if (mounted)
        setState(() {
          _isLoading = false;
        });
      _startTimer();
    });

    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    print("000000");
    if (_timer != null) _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 8), (timer) {
      if (_index == _allRoutines.length - 1) {
        if (mounted)
          setState(() {
            _index = 0;
          });
      } else {
        if (mounted)
          setState(() {
            _index++;
          });
      }
      if (mounted)
        _controller.animateToPage(
          _index,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 4),
                child: Row(
                  children: [
                    Text(
                      "Routines",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ViewAllRoutines(),
                      )),
                    )
                  ],
                ),
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 25,
                child: PageView(
                  controller: _controller,
                  children: _allRoutines
                      .map((routine) => ExerciseTypeItem(routineData: routine))
                      .toList(),
                  onPageChanged: (newIndex) {
                    setState(() {
                      _index = newIndex;
                    });
                  },
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 3),
              ),
              //SizedBox(height: SizeConfig.safeBlockVertical),
              DotsIndicator(
                dotsCount: _allRoutines.length,
                position: _index.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.black,
                  activeColor: Theme.of(context).primaryColor,
                  spacing: EdgeInsets.all(SizeConfig.safeBlockHorizontal * .75),
                  size: Size.square(SizeConfig.safeBlockHorizontal * 2),
                  activeSize: Size.square(SizeConfig.safeBlockHorizontal * 2),
                ),
              )
            ],
          );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
