import 'dart:convert';

import 'package:flutter/cupertino.dart';

class AppData with ChangeNotifier {
  //all data about exercises which in json file in asset
  static Future<List> getAllExercisesData(
      String exerciseName, BuildContext context) async {
    final jsonText = await DefaultAssetBundle.of(context)
        .loadString("assets/data/exercises_data.json");

    final data = json.decode(jsonText);

    final exerciseData = data[exerciseName];

    return exerciseData;
  }

  //all data about programs which in json file in asset
  static Future<Map> getAllProgramsData(
      int weekIndex, String programName, BuildContext context) async {
    final jsonText = await DefaultAssetBundle.of(context)
        .loadString("assets/data/programs_data.json");

    final data = json.decode(jsonText);
    final programData = data[programName][weekIndex];

    return Future.value(programData);
  }

//
}
