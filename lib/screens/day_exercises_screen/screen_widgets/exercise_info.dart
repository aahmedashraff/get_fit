import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ExerciseInfo extends StatelessWidget {
  final Map<String, dynamic> exercise;
  ExerciseInfo(this.exercise);
  @override
  Widget build(BuildContext context) {
    final rep = !exercise["repetition"].toString().contains("/")?exercise["repetition"] : exercise["repetition"].toString().substring(
                    0, exercise["repetition"].toString().indexOf("/"));
    return Row(
      children: [
        ClipRRect(
          child: Image.asset(
            exercise["image"],
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
                exercise["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                rep.contains("sec")||rep.contains("m")?rep:"$rep Reps",
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
