import 'package:CaptainSayedApp/models/routine_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/top.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/exercise_type_item.dart';
import 'package:flutter/material.dart';

class ViewAllRoutines extends StatefulWidget {
  @override
  _ViewAllRoutinesState createState() => _ViewAllRoutinesState();
}

class _ViewAllRoutinesState extends State<ViewAllRoutines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return Future.delayed(Duration.zero);
        },
        child: FutureBuilder<List<RoutineModel>>(
            future: getRoutines(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting||snapshot.hasError)
                return Center(child: CircularProgressIndicator());
              if (snapshot.hasError) {
                print("0010101010");
                // try {
                //   showErrorMessage(context: context);
                // } catch (e) {}
                print("00101mmmmmmmmmmmmmmmmmmmmmmmm01010");
                Future.delayed(Duration.zero).then((_) => showErrorMessage(
                    context: context,
                    fun: () {
                      setState(() {});
                      
                    }));
                return RefreshIndicator(
                    onRefresh: () {
                      setState(() {});
                      return Future.delayed(Duration.zero);
                    },
                    child: Container());
              }
              final routines = snapshot.data;
              return Padding(
                child: Column(
                  children: [
                    Top(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 4),
                    Text(
                      "Routines",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 4),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, i) => Column(
                          children: [
                            Container(
                              child: ExerciseTypeItem(routineData: routines[i]),
                              height: SizeConfig.safeBlockVertical * 22,
                            ),
                            Text(
                              routines[i].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   "4 Weeks",
                            //   style: TextStyle(color: Colors.black),
                            // ),
                            SizedBox(height: SizeConfig.safeBlockVertical)
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        itemCount: routines.length,
                        padding:
                            EdgeInsets.only(top: SizeConfig.safeBlockVertical),
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 4,
                  right: SizeConfig.safeBlockHorizontal * 4,
                  top: MediaQuery.of(context).padding.top +
                      SizeConfig.safeBlockVertical * 2,
                ),
              );
            }),
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
