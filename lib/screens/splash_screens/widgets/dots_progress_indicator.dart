import 'dart:async';

import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsProgressIndicator extends StatefulWidget {
  @override
  _DotsProgressIndicatorState createState() => _DotsProgressIndicatorState();
}

class _DotsProgressIndicatorState extends State<DotsProgressIndicator> {
  var _currentIndex = 0.0;
  Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        _currentIndex++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: _currentIndex % 3,
      decorator: DotsDecorator(
        color: Theme.of(context).primaryColor,
        activeColor: Colors.white,
        size: Size.square(SizeConfig.safeBlockHorizontal * 2.5),
        activeSize: Size.square(SizeConfig.safeBlockHorizontal * 2.5),
      ),
    );
  }
}
