import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/exercise_details_screen22.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/back_button.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/colors_layer_on_image.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/exercise_info.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/image_of_exercise.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/next_button.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/text_on_image.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatelessWidget {
  
  static const screenName = "/exercise-scereen";
  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: FutureBuilder(
        future: AppData.getAllExercisesData(category, context),
        builder: (_, AsyncSnapshot<List> snapShot) => snapShot
                    .connectionState !=
                ConnectionState.done
            ? Center(child: CircularProgressIndicator())
            : Stack(children: [
                ListView(
                  children: [
                    Stack(
                      children: [
                        ImageOfExercise(category),
                        ColorLayerOnImage(),
                        TextOnImage(category),
                        MyBackButton(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.safeBlockHorizontal * 4,
                      ),
                      child: Consumer<UserData>(
                        builder: (_, userData, ch) => FutureBuilder(
                          future: userData.getCurrentExerciseRound,
                          builder: (_, snap) => Text(
                            "Round ${snap.data??1}/4",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ...snapShot.data
                        .map((exercise) => Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 4,
                                bottom: SizeConfig.blockSizeVertical * 2,
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  ExerciseDetailsScreen.screenName,
                                  arguments: {
                                    "category-exercises": snapShot.data,
                                    "exercise-index":
                                        snapShot.data.indexOf(exercise),
                                  },
                                ),
                                child: ExerciseInfo(exercise),
                              ),
                            ))
                        .toList(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 10),
                  ],
                ),
                StartButton(() => Navigator.of(context).pushNamed(
                      ExerciseDetailsScreen.screenName,
                      arguments: {
                        "category-exercises": snapShot.data,
                        "exercise-index": 0,
                      },
                    ))
              ]),
      ),
      backgroundColor: Color(0xFFE9E9E9)
    );
  }
}
