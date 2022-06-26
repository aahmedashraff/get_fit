import 'dart:async';

import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CircularTimer extends StatefulWidget {
  final String exerciseDuration;
  final Function afterCompleteExercise;
  CircularTimer({this.exerciseDuration, this.afterCompleteExercise});
  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  Timer _timer;
  int _counter;
  int _totalDuration;
  var audioPlayer = AssetsAudioPlayer.newPlayer();
  AudioCache player = AudioCache();

  final alarmAudioPath = "audio/tick.mp3";
  AudioPlayer _audio1;

  @override
  void initState() {
    // final duration = widget.exerciseDuration
    //     .substring(0, widget.exerciseDuration.indexOf(" "));

    _totalDuration = int.parse(widget.exerciseDuration);
    _startTimer();
    Future.delayed(Duration(seconds: _totalDuration - 3)).then((_) async {
      // _audio1 = await player.loop(alarmAudioPath);
    });

    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    audioPlayer.dispose();
    player.clear(
      Uri.parse(alarmAudioPath),
    );
    player.clearAll();

    _audio1.dispose();

    super.dispose();
  }

  void _startTimer() {
    // if (_counter == null) {
    //   _counter = _totalDuration;
    // }
    // if (_counter == -1) {
    //   widget.afterCompleteExercise();
    //   return;
    // }
    // if (_timer != null && _timer.isActive) {
    //   _timer.cancel();
    //   return;
    // }

    _counter = _totalDuration;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          // audioPlayer.open(
          //   Audio("assets/audio/tick.mp3",),
          // );
          // player.play(alarmAudioPath);

          _counter--;
        } else {
          _audio1.stop();
          audioPlayer.open(
            Audio("assets/audio/done.mp3"),
          );
          // player.play("audio/done.mp3");

          _timer.cancel();
          print("from circle 666666666666666666");
          widget.afterCompleteExercise();
          print("from circle 555555555555555555");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2,
      fillColor: Theme.of(context).primaryColor,
      child: Text(
        "$_counter",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 2.5),
      shape: CircleBorder(),
    );
  }
}
