import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/routine_details_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ExerciseTypeItem extends StatelessWidget {
  // final String exerciseName;
  final RoutineModel routineData;

  const ExerciseTypeItem({this.routineData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                "$imageBase_URL/${routineData.img}",
                //height: SizeConfig.safeBlockVertical * 32,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                SizeConfig.safeBlockHorizontal,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.safeBlockHorizontal,
                  ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.blockSizeVertical * 5,
              left: SizeConfig.safeBlockHorizontal * 8,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: SizeConfig.safeBlockHorizontal * 2),
                    width: SizeConfig.blockSizeHorizontal * .5,
                    height: SizeConfig.blockSizeVertical * 4,
                    color: Theme.of(context).primaryColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${routineData.title}\n",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 6,
                        height: 1.1,
                      ),
                      children: [
                        TextSpan(
                          text: "${routineData.title} exercise",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: SizeConfig.safeBlockVertical,
            //   right: SizeConfig.safeBlockHorizontal * 2,
            //   child: FlatButton(
            //     child: const Text(
            //       "GO",
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //     onPressed: () => toEnterExercise(context),
            //     color: Theme.of(context).primaryColor,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(
            //             SizeConfig.safeBlockHorizontal * 2)),
            //   ),
            // ),
          ],
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RoutineDetailsScreen(
              routineData: routineData,
            ),
            
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              //spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, SizeConfig.safeBlockVertical * .25),
            )
          ]),
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical,
        // horizontal: SizeConfig.safeBlockHorizontal * 3,
      ),
    );
  }

  void toEnterExercise(BuildContext context) {
    // UserData.addTodUserWorkout(
    //     "$exerciseName Exercise ${DateTime.now().toIso8601String()}");
    // Provider.of<UserData>(context, listen: false)
    //     .setCurrentExercise(exerciseName);
    // Navigator.of(context)
    // .pushNamed(ExerciseScreen.screenName, arguments: exerciseName);
  }
}
