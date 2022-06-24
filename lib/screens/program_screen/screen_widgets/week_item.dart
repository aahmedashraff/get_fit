
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/screens/day_exercise_screen_new/all_exercises_in_day_screen.dart';
import 'package:CaptainSayedApp/screens/program_screen/screen_widgets/day.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeekItem extends StatelessWidget {
  final String weekNumber;
  final List<dynamic> weekData;
  final String programName;
  final String programImage;
  final String programId;
  // final bool isOpened;

  // final List<int> restDays;
  WeekItem({
    @required this.weekNumber,
    this.programImage,
    this.programName,
    this.programId,
    // @required this.isOpened,
    // this.restDays,
    this.weekData,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockVertical * 2,
              ),
              child: Row(
                children: [
                  Text(
                    weekNumber,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                    ),
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //       text: "0",
                  //       style: TextStyle(
                  //         color: Theme.of(context).primaryColor,
                  //         fontSize: SizeConfig.safeBlockHorizontal * 5,
                  //       ),
                  //       children: [
                  //         TextSpan(
                  //           text: "/7",
                  //           style: TextStyle(
                  //             fontSize: SizeConfig.safeBlockHorizontal * 5,
                  //             color: Colors.black,
                  //           ),
                  //         )
                  //       ]),
                  // ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            for (var day = 1; day < 8; day++)
              Stack(
                children: [
                  Consumer<Prog>(
                    builder: (_, p, __) {
                      final dayData = weekData[day - 1][0];
                      return Day(
                        dayNumber: day,
                        //weekNumber: int.parse(weekNumber.split(" ")[1]),
                        isOpened: true,
                        progress: dayData is bool
                            ? (dayData == true ? "0" : null)
                            : (dayData.toString().contains(".")
                                ? dayData.toString().substring(
                                    0, dayData.toString().indexOf("."))
                                : dayData.toString()),
                        isRest: dayData is bool && dayData == false,
                      );
                    },
                  ),
                  if ((weekData[day - 1][0] is bool &&
                          weekData[day - 1][0] != false) ||
                      !(weekData[day - 1][0] is bool))
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AllExercisesInDayScreen(
                                programImage: programImage,
                                programName: programName,
                                dayId: day.toString(),
                                weekId: weekNumber.split(" ")[1],
                                programId: programId,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                ],
              ),
          ],
        ),
      ),
      // if (!isOpened) ClosedWeekFillColor(),
      // if (!isOpened) ClosedWeekIcon(),
    ]);
  }
}
