import 'dart:convert';
import 'dart:io';

import 'package:CaptainSayedApp/models/album_item_model.dart';
import 'package:CaptainSayedApp/models/article_model.dart';
import 'package:CaptainSayedApp/models/category_model.dart';
import 'package:CaptainSayedApp/models/program_exercise_model.dart';
import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/models/routine_exercise_model.dart';
import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const api_URL = 'https://gotfit.net/api';
const imageBase_URL = 'https://gotfit.net/public/storage/';

Future<List<ArticleModel>> getArticles() async {
  try {
    final response = await http.get(Uri.parse(
      "$api_URL/articles",
    ));
    final data = json.decode(response.body)["articles"] as List;
    return data
        .map((articleData) => ArticleModel.fromJson(articleData))
        .toList();
  } catch (e) {
    throw e;
  }
}

Future<List<AlbumItemModel>> getAlbum() async {
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/albums",
      ),
    );
    final data = json.decode(response.body)["albums"] as List;
    return data
        .map((articleData) => AlbumItemModel.fromJson(articleData))
        .toList();
  } catch (e) {
    throw e;
  }
}

Future<List<RoutineModel>> getRoutines() async {
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/routines",
      ),
    );
    final data = json.decode(response.body)["routines"] as List;
    return data
        .map((routinesData) => RoutineModel.fromJson(routinesData))
        .toList();
  } catch (e) {
    throw e;
  }
}

Future<List<RoutineExerciseModel>> getExercisesInRoutines(
    String routineId) async {
  try {
    final response = await http.post(
      Uri.parse("$api_URL/routine_exercises"),
      body: {"routine_id": routineId},
    );
    final data = json.decode(response.body)["exercises"] as List;
    return data
        .map((exerciseData) => RoutineExerciseModel.fromJson(exerciseData))
        .toList();
  } catch (e) {
    throw e;
  }
}

Future<Map<String, List<ProgramModel>>> getCategories() async {
  try {
    final response = await http.get(
      Uri.parse("$api_URL/categories"),
    );
    final data = json.decode(response.body)["categories"] as List;
    final allCategories = data
        .map((categoryData) => CategoryModel.fromJson(categoryData))
        .toList();
    Map<String, List<ProgramModel>> catiegoriesWithPrograms = {};
    await Future.forEach(allCategories, ((CategoryModel category) async {
      final res = await http.get(
        Uri.parse("$api_URL/programs-by-category/${category.id}"),
      );
      final programsInCategoryData = json.decode(res.body)["programs"] as List;
      final allProgramsInCategory = programsInCategoryData
          .map((data) => ProgramModel.fromJson(data))
          .toList();

      catiegoriesWithPrograms.addAll({category.name: allProgramsInCategory});
    }));
    return catiegoriesWithPrograms;
  } catch (e) {
    throw e;
  }
}

Future<Map<String, List<ProgramExerciseModel>>> getDayExercises(
    {String programId, String dayId, String weekId}) async {
  try {
    final response = await http.post(
      Uri.parse("$api_URL/pwd_exercises"),
      body: {
        "program_id": programId,
        "week_id": weekId,
        "day_id": dayId,
      },
    );
    // print(json.decode(response.body)["exercises"]);
    print("000000000000000");
    final data = json.decode(response.body)["exercises"] as List;

    var allDayExercises = data
        .map((exerciseData) => ProgramExerciseModel.fromJson(exerciseData))
        .toList();
    //*********************************** */
    // var temp = allDayExercises[allDayExercises.length - 1];
    // allDayExercises.removeLast();
    // allDayExercises.insert(0, temp);
    //************************************************ */

    Set<String> sequencesInfo = {};
    allDayExercises.forEach((e) {
      sequencesInfo.add(
          "${e.sequence["id"]}&${e.sequence["repeat"]}&${e.sequence["title"]}");
    });

    Map<String, List<ProgramExerciseModel>> seqWithExercises = {};
    sequencesInfo.forEach((seqInfo) {
      List<ProgramExerciseModel> exercises = [];
      allDayExercises.forEach((e) {
        if (e.sequence["id"].toString() == seqInfo.split("&")[0]) {
          exercises.add(e);
        }
      });
      seqWithExercises.addAll({seqInfo: exercises});
    });

    return seqWithExercises;
  } catch (e) {
    throw e;
  }
}

Future<void> sendMessage({
  String message,
  String title,
  String token,
}) async {
  try {
    final response = await http.post(
      Uri.parse(
        "$api_URL/message",
      ),
      body: {"title": title, "message": message},
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
  } catch (e) {
    throw e;
  }
}

Future<void> resetProgress({int programId, BuildContext context}) async {
  final token = Provider.of<UserData>(context, listen: false).userToken;
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text("Are you sure?"),
            content:
                const Text("Do you want to reset progress for this program?"),
            actions: [
              FlatButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  try {
                    await http.post(
                      Uri.parse(
                        "$api_URL/reset_progress",
                      ),
                      body: {"program_id": programId.toString()},
                      headers: {
                        HttpHeaders.authorizationHeader: "Bearer $token"
                      },
                    );
                  } catch (e) {
                    showDialogMessage(
                      context: context,
                      title: "Error",
                      message: "Check your connection and try again",
                    );
                    return;
                  }
                  showDialogMessage(
                    context: context,
                    title: "Done",
                    message: "Your Progress is resetted.",
                  );
                },
                child: const Text("Yes"),
                textColor: Theme.of(context).primaryColor,
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("No"),
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ));
}

Future<List<ProgramModel>> getRecommendedPrograms({
  String token,
}) async {
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/programs-by-goals-and-levels",
      ),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    final data = json.decode(response.body)["programs"] as List;
    final allPrograms =
        data.map((item) => ProgramModel.fromJson(item)).toList();
    return allPrograms;
  } catch (e) {
    throw e;
  }
}

Future<List<ProgramModel>> getPremiumPrograms(
    {String token, String passcode}) async {
  try {
    final response = await http.post(
      Uri.parse(
        "$api_URL/premium-programs",
      ),
      body: {"passcode": passcode},
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    final data = json.decode(response.body)["programs"] as List;
    final allPrograms =
        data.map((item) => ProgramModel.fromJson(item)).toList();
    return allPrograms;
  } catch (e) {
    throw e;
  }
}

Future<void> uploadBeforeAndAfter({File beforeImage, File afterImage}) async {
  var dio = Dio();
  final formData = FormData.fromMap({
    "image_before": await MultipartFile.fromFile(beforeImage.path),
    "image_after": await MultipartFile.fromFile(afterImage.path),
  });

  try {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    dio.options.headers["Authorization"] = "Bearer $token";

    await dio.post(
      "$api_URL/albums/store",
      data: formData,
    );
  } catch (e) {
    throw e;
  }
}

Future<void> addToFavourite({
  String token,
  int exerciseId,
}) async {
  try {
    final response = await http.post(
      Uri.parse(
        "$api_URL/create_favourite",
      ),
      body: {"exercise_id": exerciseId.toString()},
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    final data = json.decode(response.body);
    if (data["favourite"].toString().contains("already exist")) {
      throw "This exercise is already exist on your favorite list";
    }
  } catch (e) {
    throw e;
  }
}

Future<void> removeFav(String token, String favID) async {
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/delete_favourite/$favID",
      ),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
  } catch (e) {
    throw e;
  }
}

Future<void> removSave(String token, String saveID) async {
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/delete_saves/$saveID",
      ),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
  } catch (e) {
    throw e;
  }
}

Future<void> addToSaves({
  String token,
  String exersiceId,
}) async {
  try {
    final response = await http.post(
      Uri.parse(
        "$api_URL/create_save/$exersiceId",
      ),
      // body: {"program_id": programId},
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    final data = json.decode(response.body);

    if (data["favourite"].toString().contains("already exist")) {
      throw "This exercise is already exist on your favorite list";
    }
  } catch (e) {
    throw e;
  }
}

Future<Map<String, ProgramExerciseModel>> getFavourite({
  String token,
}) async {
  Map<String, ProgramExerciseModel> favs = {};
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/favourits",
      ),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    final favData = json.decode(response.body)["favoruites"] as List;
    favData.forEach((data) {
      if (data["exercise"] != null) {
        favs.addAll({
          data["id"].toString(): ProgramExerciseModel.fromJson(data["exercise"])
        });
      }
    });

    return favs;
  } catch (e) {
    throw e;
  }
}

Future<Map<String, ProgramModel>> getSaves({
  String token,
}) async {
  Map<String, ProgramModel> saves = {};
  try {
    final response = await http.get(
      Uri.parse(
        "$api_URL/saves",
      ),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    final saveData = json.decode(response.body)["saves"] as List;
    saveData.forEach((data) {
      if (data["program"] != null) {
        saves.addAll(
            {data["id"].toString(): ProgramModel.fromJson(data["program"])});
      }
    });
    return saves;
  } catch (e) {
    throw e;
  }
}

Future<List<ProgramModel>> search(String word) async {
  final response = await http.post(
    Uri.parse(
      "https://gotfit.net/api/search-program",
    ),
    body: {"name": word},
  );
  final data = json.decode(response.body) as List;
  final searchResult =
      data.map((programData) => ProgramModel.fromJson(programData)).toList();
  return searchResult;
}

Future<void> download(
    {String url,
    String exerciseTitle,
    String exerciseInfo,
    String exerciseId,
    String imageUrl}) async {
  // return;
  try {
    final pref = await SharedPreferences.getInstance();
    List<String> oldDownloads = pref.getStringList("downloads") ?? [];

    Dio dio = Dio();

    var path = "&&$exerciseId&&$exerciseTitle&&$exerciseInfo&&$imageUrl&&.mp4";
    var dir = await getApplicationDocumentsDirectory();
    if (oldDownloads.contains("${dir.path}/$path")) {
      return;
    }

    await dio.download("$imageBase_URL/$url", "${dir.path}/$path",
        onReceiveProgress: (rec, total) {
      print(rec / total * 100);
    });

    oldDownloads.add("${dir.path}/$path");
    pref.setStringList("downloads", [...oldDownloads]);
  } on Exception catch (e) {
    throw e;
  }
}

Future<List<String>> getDownloads() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getStringList("downloads") ?? [];
}

Future<void> deleteDownloads(String path) async {
  // var dir = await getApplicationDocumentsDirectory();
  Directory(path).deleteSync(recursive: true);
  final pref = await SharedPreferences.getInstance();
  var allDownloads = pref.getStringList("downloads");
  allDownloads.remove(path);
  pref.setStringList("downloads", [...allDownloads]);
}

Future<void> updateEmailOrPass(
    {String token, bool isEmail, String updated}) async {
  Map<String, dynamic> body;
  try {
    if (isEmail) {
      body = {"email": updated};
    } else {
      final userDataResponse = await http.get(
        Uri.parse(
          "$api_URL/my-profile",
        ),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      final userEmail = json.decode(userDataResponse.body)["email"] as String;
      body = {"email": userEmail, "password": updated};
    }

    final response = await http.post(
      Uri.parse(
        "$api_URL/update-profile",
      ),
      body: body,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (json.decode(response.body)["id"] == null) throw "Error";
  } catch (e) {
    throw e;
  }
}
