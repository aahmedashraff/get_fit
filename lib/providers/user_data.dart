import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData with ChangeNotifier {
  //this user data is used when user is register
  Map<String, dynamic> _userData = {
    "email": "",
    "image": "",
    "level": 2,
    "goal": 1,
    "gender": 2,
  };

  Map<String, dynamic> get getUserData => _userData;

  void setImgePath(String imagePath) {
    _userData["image"] = imagePath;
  }

  void setLevel(int levelId) {
    _userData["level"] = levelId;
  }

  void setGoal(int goalId) {
    _userData["goal"] = goalId;
  }

  void setGender(int genderId) {
    _userData["gender"] = genderId;
  }

  Map<String, String> _allUserData = {
    "email": "",
    "FullName": "",
    "Gender": "",
    "BirthDate": "",
    "country": "",
    "weight": "",
    "token": ""
    //"email": ""
  };

  Future<void> updateToken({String newToken}) async {
    _allUserData["token"] = newToken ?? "";
  }

  Future<void> prepareAllUserDataAtAppLaunch() async {
    _allUserData["token"] = await getUserToken();
    _allUserData["FullName"] = await getUserFullName();
    _allUserData["Gender"] = await isMaleUser ? "Male" : "Female";
    _allUserData["BirthDate"] = await getBirthDate;
    _allUserData["country"] = await getUserCountry();
    _allUserData["weight"] = (await getUserWeight()).toString();
    _allUserData["email"] = await getUserEmail();
  }

  String get userGender => _allUserData["Gender"];
  String get userBithDate => _allUserData["BirthDate"];
  String get userFullName => _allUserData["FullName"];
  String get userCountry => _allUserData["country"];
  String get userWeight => _allUserData["weight"];
  String get userToken => _allUserData["token"];
  String get userEmail => _allUserData["email"];

  Future<String> getUserToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("token") ?? "";
  }

  // gender info
  Future<void> selectGender() async {
    if (_allUserData["Gender"] == "Male") {
      setGender(2);
      _allUserData["Gender"] = "Female";
    } else {
      _allUserData["Gender"] = "Male";
      setGender(1);
    }
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    bool userIsMale = await isMaleUser;
    pref.setBool("userIsMale", !userIsMale);
  }

  Future<bool> get isMaleUser async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("userIsMale") ?? true;
  }

  //-------------------------------------------------------------
  //user image
  Future<void> setUserImagePath(String path) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("imagePath", path);
    notifyListeners();
  }

  Future<String> get getUserImagePath async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("imagePath");
  }

  //---------------------------------------

  //weight
  Future<void> setUserWeight(int weight) async {
    _allUserData["weight"] = weight.toString();
    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    pref.setInt("weight", weight);
  }

  static Future<int> getUserWeight() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt('Weight') ?? 90;
  }

  //--------------------------------------------------

  //birth data
  static Future<String> get getBirthDate async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("BirthDate") ??
        DateTime(1995, 1, 1).toIso8601String();
  }

  Future<void> setBirthData(String date) async {
    _allUserData["BirthDate"] = date;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.setString("BirthDate", date);
  }
  //--------------------------------------------------------

  // level info
  String _userLevel = "Beginner";
  String get getUserLevel => _userLevel;
  int _levelNum = 1;
  void selectUserLevel(String selectedLevel) {
    _userLevel = selectedLevel;
    switch (selectedLevel) {
      case "Newbie":
        _levelNum = 8;
        _userData["level"] = 8;

        break;
      case "Beginner":
        _levelNum = 5;
        _userData["level"] = 5;
        break;
      case "Intermediate":
        _levelNum = 6;
        _userData["level"] = 6;

        break;
      case "Advanced":
        _levelNum = 7;
        _userData["level"] = 7;

        break;
    }
    notifyListeners();
  }

  int get getLevelNum {
    return _levelNum;
  }
  //----------------------------------------------------------------

  String _userGoal = "Build Strength";
  String get getUserGoal => _userGoal;
  int _goalNum = 3;
  void selectUserGoal(String selectedGoal) {
    _userGoal = selectedGoal;
    switch (selectedGoal) {
      case "Build Strength":
        _goalNum = 3;
        _userData["goal"] = 3;

        break;
      case "Build Muscle":
        _goalNum = 2;
        _userData["goal"] = 2;
        break;
      case "Lose Fat":
        _goalNum = 1;
        _userData["goal"] = 1;

        break;
      case "Learn Skills":
        _goalNum = 5;
        _userData["goal"] = 5;

        break;
    }
    notifyListeners();
  }

  int get getGoalNum {
    return _goalNum;
  }

  //---------------------------------------------------

  //user name
  String _userFullName = "New User";
  void updateFullName(String name) => _userFullName = name;

  Future<void> saveUserFullName({String name}) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("New User", name ?? _userFullName);
    if (name != null) _allUserData["FullName"] = name;
    notifyListeners();
  }

  static Future<String> getUserFullName() async {
    final pref = await SharedPreferences.getInstance();
    return (pref.getString("full-name" ?? "NewUser"));
  }
  //------------------------------------------------------------

  //user email
  Future<String> getUserEmail() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getString("email") ?? "___";
  }

  Future<void> setUserEmail(String email) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
    _allUserData["email"] = email;
    notifyListeners();
  }

  //-----------------------------------------

  //user country
  Future<void> saveUserContry(String country) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("country", country);
    _allUserData["country"] = country;
    notifyListeners();
  }

  static Future<String> getUserCountry() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("country") ?? "ــــ";
  }

  //user work out
  static Future<void> addTodUserWorkout(String workout) async {
    final pref = await SharedPreferences.getInstance();
    final previousWorks = pref.getStringList("user./workout") ?? [];
    //the workout comes in format "WorkoutName LevelOrExercise DateTime"

    if (previousWorks.length == 0) {
      pref.setStringList("user./workout", previousWorks..add(workout));
      return;
    }
    final workoutName = workout.split(" ")[0];
    for (var work in previousWorks) {
      if (work.split(" ")[0] == workoutName) {
        break;
      } else if (previousWorks.indexOf(work) == previousWorks.length - 1) {
        pref.setStringList("user./workout", previousWorks..add(workout));
        return;
      }
    }
  }

  static Future<List<String>> getUserWorkOut() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList("user./workout") ?? [];
  }

  //--------------------------------

  String _currentExercise = "";
  String get getCurrentExerciseName => _currentExercise;

  void setCurrentExercise(String exerciseName) {
    _currentExercise = exerciseName;
  }

  Future<int> get getCurrentExerciseRound async {
    int round = await getExerciseRound(_currentExercise);
    return round;
  }

  Future<void> setExerciseRound(String exerciseName) async {
    final pref = await SharedPreferences.getInstance();
    int round = pref.getInt(exerciseName);
    if (round == null) {
      round = 1;
    } else if (round == 4) {
      round = 0;
    }

    // if (round == null || round == 4) {
    //   round = 0;
    // }
    pref.setInt(exerciseName, round + 1);
    notifyListeners();
  }

  static Future<int> getExerciseRound(String exerciseName) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(exerciseName);
  }

  //set current program name which user is showing it
  var _currentPorgramName = "";
  void updateCurrentProgramName(String name) => _currentPorgramName = name;
  String get getCurrentProgramName => _currentPorgramName;

  //set current program  week's number which user is showing it
  var _currentPorgramWeekNum = 1;
  void updateCurrentProgramWeekNum(int numb) => _currentPorgramWeekNum = numb;
  int get getCurrentProgramWeekNum => _currentPorgramWeekNum;

  //set current program day in the week number which user is showing it
  var _currentPorgramDayNum = 1;
  void updateCurrentProgramDayNum(int numb) => _currentPorgramDayNum = numb;
  int get getCurrentProgramDayNum => _currentPorgramDayNum;
}
