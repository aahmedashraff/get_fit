import 'dart:convert';
import 'dart:io';

import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Prog with ChangeNotifier {
  int _progress = 1;
  int get getProgress => _progress;
  Future<void> getRoutineProgress({String token, String routineId}) async {
    final response = await http.get(
      Uri.parse(
        "$api_URL/get_routine_progress/$routineId",
      ),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    var progress = json.decode(response.body)["progress"] as String;
    if (progress == null) progress = "1";
    _progress = int.parse(progress);
    notifyListeners();
    // return int.parse(progress);
  }

  void updateRoutineProgress({String token, String routineId, int routineRep}) {
    if (_progress == routineRep) {
      _progress = 1;
    } else {
      _progress += 1;
    }
    notifyListeners();
    try {
      http.get(
        Uri.parse(
          "$api_URL/routine_progress/$routineId",
        ),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
    } catch (e) {
      if (_progress == 1)
        _progress = routineRep;
      else
        _progress -= 1;
      notifyListeners();
    }
  }

  //-----------------------------------

  Map<String, List<dynamic>> _daysData = {};
  Map<String, List<dynamic>> get getDaysData => {..._daysData};
  Future<Map<String, List<dynamic>>> getProgressAndRestDays({
    String programId,
    int totalWeeks,
    String token,
  }) async {
    Map<String, List<dynamic>> progressAndRestData = {};
    try {
      for (var week = 1; week <= totalWeeks; week++) {
        final response = await http.get(
            Uri.parse(
              "$api_URL/program/$programId/week/$week",
            ),
            headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

        final data = json.decode(response.body)["days_data"] as List;

        progressAndRestData.addAll({"Week $week": data});
      }
      _daysData = {...progressAndRestData};
    } catch (e) {
      throw e;
    }

    notifyListeners();
    return progressAndRestData;
  }

  Future<void> updateDayProgress(
      {String programId,
      String weekId,
      String dayId,
      String token,
      BuildContext context}) async {
    try {
      final response = await http.post(
        Uri.parse(
          "$api_URL/progress",
        ),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: {
          "program_id": programId,
          "week_id": weekId,
          "day_id": dayId,
        },
      );
      String progress = json.decode(response.body)["progress"];
      if (double.parse(progress.substring(0, progress.indexOf("%"))) > 99.6) {
        await Provider.of<Prog>(context, listen: false).updateDayProgress(
          dayId: dayId,
          programId: programId,
          weekId: weekId,
          token: token,
        );
        return;
      }

      //this line only to throw error if the progress response is not a number

      // double.parse(progress);
      var weekData = _daysData["Week $weekId"];
      weekData[int.parse(dayId) - 1][0] =
          progress.substring(0, progress.indexOf("%"));
      _daysData["Week $weekId"] = weekData;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  int _currentExerciseIndex = 0;
  int get getCurrentIndex => _currentExerciseIndex;
  void updateIndex(int index) {
    _currentExerciseIndex = index;
    // notifyListeners();
  }
}
