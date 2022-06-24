import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgramProgress with ChangeNotifier {
  //day current round
  static Future<void> setDayRound({
    String programName,
    int weekNumber,
    int dayNumber,
    String round,
  }) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("$programName-$weekNumber-$dayNumber-.", round);
  }

  static Future<String> getCurrentRound({
    String programName,
    int weekNumber,
    int dayNumber,
  }) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("$programName-$weekNumber-$dayNumber-.") ?? "round 0";
  }
  //---------------------------------------------------------------------

  //round's finished exercises number
  static Future<int> getRoundFinishedExercisesNum({
    String programName,
    int weekNumber,
    int dayNumber,
  }) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt("$programName-$weekNumber-$dayNumber-num-.") ?? 0;
  }

  static Future<void> setRoundFinishedExercisesNum({
    String programName,
    int weekNumber,
    int dayNumber,
    int roundFinishedExercisesNum,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final numberBeforeUpdate = await getRoundFinishedExercisesNum(
      dayNumber: dayNumber,
      weekNumber: weekNumber,
      programName: programName,
    );
    pref.setInt("$programName-$weekNumber-$dayNumber-num-.",
        roundFinishedExercisesNum ?? numberBeforeUpdate + 1);
  }
  //-----------------------------------------------

  //total exercises finished in day
  static Future<int> getDayTotalExercisesFinshid({
    String programName,
    int weekNumber,
    int dayNumber,
  }) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt("$programName-$weekNumber-$dayNumber-total-.") ?? 0;
  }

  Future<void> setDayTotalExercisesFinshid(
      {String programName,
      int weekNumber,
      int dayNumber,
      int finshiedNum}) async {
    final pref = await SharedPreferences.getInstance();
    final numberBeforeUpdate = await getDayTotalExercisesFinshid(
      dayNumber: dayNumber,
      weekNumber: weekNumber,
      programName: programName,
    );
    pref.setInt("$programName-$weekNumber-$dayNumber-total-.",
        finshiedNum ?? numberBeforeUpdate + 1);
    notifyListeners();
  }

  static Future<void> setIsLastRoundAndLastExercise(bool isLastAndLast) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("key", isLastAndLast);
  }

  //program progress

  //total exercises in a program
  static Future<int> totalExercisesInProgram(
      String programName, BuildContext context) async {
    int totalExercisesInProgram;
    final pref = await SharedPreferences.getInstance();
    totalExercisesInProgram = pref.getInt("total-in-$programName");
    // if it's first time to use enter this program
    if (totalExercisesInProgram == null) {
      totalExercisesInProgram = 0;
      final jsonText = await DefaultAssetBundle.of(context)
          .loadString("assets/data/programs_data.json");
      final data = json.decode(jsonText);
      final programData = List<Map<String, dynamic>>.from(data[programName]);
      for (var week in programData) {
        for (var dayData in week.values.toList()) {
          dayData.forEach((key, value) {
            totalExercisesInProgram += value["round exercises"].length *
                int.parse(value["round repetition"]);
          });
        }
      }
      pref.setInt("total-in-$programName", totalExercisesInProgram);
    }
    print(totalExercisesInProgram);

    return totalExercisesInProgram;
  }

  // when user finishes all exercise in a particular day, store this info in
  // memory to stop icreasing the program progress if he takes that day again
  static Future<bool> isUserFinishDayForOneTime({
    String progName,
    int weekNum,
    int dayNum,
  }) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("finish-$progName$weekNum$dayNum") ?? false;
  }

  static Future<void> setIsUserFinishDayForOneTime({
    String progName,
    int weekNum,
    int dayNum,
  }) async {
    final pref = await SharedPreferences.getInstance();
    print("dddddddddddddddddddddddddddddddddddddd");
    if (!(pref.getBool("finish-$progName$weekNum$dayNum") ?? false))
      pref.setBool("finish-$progName$weekNum$dayNum", true);
  }
  //----------------------------------------------

  //total finshed exercises in program
  static Future<int> getProgramTotalProgress(String progName) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt("total-progress$progName") ?? 0;
  }

  Future<void> updateProgramTotalProgress(
      String progName, int dayNum, int weekNum) async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getBool("finish-$progName$weekNum$dayNum") ?? false) return;

    final lastProgress = pref.getInt("total-progress$progName") ?? 0;

    pref.setInt("total-progress$progName", lastProgress + 1);
    notifyListeners();
  }

  Future<void> resetProgram(String programName) async {
    print(programName);
    final pref = await SharedPreferences.getInstance();
    final allKeysInMemory = pref.getKeys();
    print("a7a");
    print(allKeysInMemory);
    allKeysInMemory.forEach((key) {
      if (key.contains(programName)) {
        if (pref.get(key) is String)
          pref.setString(key, null);
        else if (pref.get(key) is int)
          pref.setInt(key, null);
        else
          pref.setBool(key, null);
      }
    });
    notifyListeners();
  }
}
