import 'package:CaptainSayedApp/models/routine_exercise_model.dart';
import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen_new/exercise_detail_screen.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/back_button.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/colors_layer_on_image.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/exercise_info.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/image_of_exercise.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/next_button.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/text_on_image.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutineDetailsScreen extends StatelessWidget {
  final RoutineModel routineData;

  const RoutineDetailsScreen({Key key, this.routineData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserData>(context, listen: false).userToken;
    return Scaffold(
        body: FutureBuilder<List<RoutineExerciseModel>>(
            future: getExercisesInRoutines(routineData.id.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.hasError)
                return Center(child: CircularProgressIndicator());
              final progrssData = Provider.of<Prog>(context, listen: false);
              return FutureBuilder(
                  future: progrssData.getRoutineProgress(
                    routineId: routineData.id.toString(),
                    token: token,
                  ),
                  builder: (context, progresSnapshot) {
                    if (progresSnapshot.connectionState ==
                            ConnectionState.waiting ||
                        progresSnapshot.hasError)
                      return Center(child: CircularProgressIndicator());
                    return Stack(children: [
                      ListView(
                        children: [
                          Stack(
                            children: [
                              ImageOfExercise(routineData.img),
                              ColorLayerOnImage(),
                              TextOnImage(routineData.title),
                              MyBackButton(),
                            ],
                          ),
                          Consumer<Prog>(
                            builder: (_, p, __) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockSizeVertical * 2,
                                horizontal: SizeConfig.safeBlockHorizontal * 4,
                              ),
                              child: Text(
                                "Round ${p.getProgress}/${routineData.rounds}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.5,
                                ),
                              ),
                            ),
                          ),
                          ...snapshot.data
                              .map((exerciseData) => Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 4,
                                      bottom: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ExerciseDetailScreen(
                                            allExercises: snapshot.data,
                                            exerciseIndex: snapshot.data
                                                .indexOf(exerciseData),
                                            routineData: routineData,
                                          ),
                                        ),
                                      ),
                                      // Navigator.of(context).pushNamed(
                                      //   ExerciseDetailsScreen.screenName,
                                      //   arguments: {
                                      //     "category-exercises": snapShot.data,
                                      //     "exercise-index":
                                      //         snapShot.data.indexOf(exercise),
                                      //   },
                                      // ),
                                      child: ExerciseInfo(exerciseData),
                                    ),
                                  ))
                              .toList(),
                          SizedBox(height: SizeConfig.safeBlockVertical * 10),
                        ],
                      ),
                      StartButton(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExerciseDetailScreen(
                              allExercises: snapshot.data,
                              exerciseIndex: 0,
                              routineData: routineData,
                            ),
                          ),
                        );
                      })
                    ]);
                  });
            }),
        backgroundColor: Color(0xFFE9E9E9));
  }
}
