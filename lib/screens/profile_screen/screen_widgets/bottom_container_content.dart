import 'package:CaptainSayedApp/screens/profile_screen/workout/work_out.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class BottomContainerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: FittedBox(
              child: const Text(
                "Workout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 6),
            height: SizeConfig.screenHeight * 3 / 100,
          ),
          Workout()
        ],
      ),
    );
  }
}
