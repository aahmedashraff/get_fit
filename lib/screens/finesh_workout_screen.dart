import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class FineshWorkoutScreen extends StatelessWidget {
  static const screenName = "/finesh-workout-screen";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Spacer(flex: 5),
              Text(
                "Finish Workout",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 2),
              Container(
                child: Icon(
                  AppIcon.check,
                  color: Colors.white,
                  size: SizeConfig.safeAverage * 10,
                ),
                width: SizeConfig.safeAverage * 15,
                height: SizeConfig.safeAverage * 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
              Spacer(flex: 4),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF77382C), Theme.of(context).primaryColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
        ),
      ),
    );
  }
}
