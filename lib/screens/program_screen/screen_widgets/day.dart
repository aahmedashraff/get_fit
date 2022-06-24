import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/providers/program_progress.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Day extends StatelessWidget {
  final int dayNumber;
  // final int weekNumber;
  final bool isOpened;
  final bool isRest;
  final String progress;

  const Day(
      {this.dayNumber,
      // @required this.weekNumber,
      this.isOpened,
      this.isRest,
      this.progress});

  // Future<String> _progressInDay(BuildContext context) async {
  //   int totalExercisesInDay = 0;
  //   final programName =
  //       Provider.of<UserData>(context, listen: false).getCurrentProgramName;
  //   final data =
  //       await AppData.getAllProgramsData(weekNumber - 1, programName, context);

  //   final dayData =
  //       Map<String, Map<String, dynamic>>.from(data["day $dayNumber"]);
  //   final roundsInDay = dayData.keys.toList();
  //   for (var round in roundsInDay) {
  //     totalExercisesInDay += dayData[round]["round exercises"].length *
  //         int.parse(dayData[round]["round repetition"]);
  //   }

  //   final finshedExercisesInDay =
  //       await ProgramProgress.getDayTotalExercisesFinshid(
  //     dayNumber: dayNumber,
  //     programName: programName,
  //     weekNumber: weekNumber,
  //   );
  //   final progress = (finshedExercisesInDay / totalExercisesInDay) * 100;
  //   return progress.toStringAsFixed(0);
  // }

  @override
  Widget build(BuildContext context) {
    final change = Provider.of<ProgramProgress>(context);
    return GestureDetector(
      onTap: isRest
          ? () {}
          : () {
              // Provider.of<UserData>(context, listen: false)
              //     .updateCurrentProgramWeekNum(weekNumber);
              // Provider.of<UserData>(context, listen: false)
              //     .updateCurrentProgramDayNum(dayNumber);
              // Navigator.of(context).pushNamed(DayExercisesScreen.screenName,
              //     arguments: {
              //       "week-number": weekNumber,
              //       "day-number": dayNumber
              //     });
            },
      child: Container(
        child: Row(
          children: [
            Text(
              "Day $dayNumber",
              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4),
            ),
            Spacer(),
            if (isRest)
              Icon(
                AppIcon.sleep,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            if (!isRest)
              Icon(
                AppIcon.sleep,
                size: SizeConfig.safeBlockVertical * 4.5,
              ),
            // CircularPercentIndicator(
            //   radius: SizeConfig.blockSizeVertical * 4.5,
            //   percent: int.parse(progress) / 100,
            //   lineWidth: SizeConfig.safeBlockVertical * .3,
            //   backgroundColor: Colors.grey.withOpacity(.5),
            //   progressColor: Theme.of(context).primaryColor,
            //   center: Text(
            //     "$progress%",
            //     style: TextStyle(
            //       color: Theme.of(context).primaryColor,
            //       fontSize: SizeConfig.safeBlockVertical * 1.4,
            //     ),
            //   ),
            // ),
            // End of circular
            // Consumer<ProgramProgress>(
            //                 builder:(_,p,ch)=> FutureBuilder(
            //     future: _progressInDay(context),
            //     builder: (_, snap) =>
            //         snap.connectionState == ConnectionState.waiting
            //             ? CircularProgressIndicator()
            //             : ,
            //   ),
            // ),
            // if (!isOpened)
            //   Text(
            //     "?",
            //     style: TextStyle(
            //       fontSize: SizeConfig.safeBlockVertical * 2.5,
            //     ),
            //   )
          ],
        ),
        width: double.infinity,
        //margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xFFE9E9E9),
            border: Border.all(
              width: SizeConfig.safeBlockHorizontal * .25,
            ),
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 2,
                offset: Offset(0, SizeConfig.safeBlockVertical * .5),
              )
            ]),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 4,
        ),
        margin: EdgeInsets.fromLTRB(
          SizeConfig.safeBlockHorizontal * 4,
          0,
          SizeConfig.safeBlockVertical * 2,
          SizeConfig.safeBlockHorizontal * 4,
        ),
      ),
    );
  }
}
