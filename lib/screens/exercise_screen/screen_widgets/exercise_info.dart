import 'package:CaptainSayedApp/models/routine_exercise_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ExerciseInfo extends StatelessWidget {
  final RoutineExerciseModel exerciseData;
  ExerciseInfo(this.exerciseData);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Image.network(
            "$imageBase_URL/${exerciseData.main_img}",
            height: SizeConfig.safeBlockVertical * 9,
            width: SizeConfig.safeBlockHorizontal * 35,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(
            SizeConfig.blockSizeHorizontal * 2,
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 1,
            ),
            child: ListTile(
              title: Text(
                exerciseData.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                exerciseData.exercise_duration == null ||
                        exerciseData.exercise_duration == "0"
                    ? "${exerciseData.reps} reps"
                    : "${exerciseData.exercise_duration} sec",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
