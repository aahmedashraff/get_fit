import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/screens/program_info_screen/program_info_screen.dart';
import 'package:CaptainSayedApp/screens/program_screen/screen_widgets/program_image.dart';
import 'package:CaptainSayedApp/screens/program_screen/screen_widgets/week_item.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramScreen extends StatelessWidget {
  static const screenName = "/program-screen";
  final ProgramModel program;

  const ProgramScreen({Key key, this.program}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userToken = Provider.of<UserData>(context, listen: false).userToken;
    final progressData = Provider.of<Prog>(context, listen: false);
    // getProgressAndRestDays(
    //   programId: program.id.toString(),
    //   totalWeeks: int.parse(program.weeks),
    //   token: userToken,
    // );
    return Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                ProgramImage(
                  programName: program.title,
                  isForProgramInfo: false,
                  imageUrl: program.img,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical),
                if (program.description != null)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 4),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: program.description.length > 130
                              ? "${program.description.substring(0, 130)}.... "
                              : program.description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        if (program.description.length > 130)
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ProgramInfoScreen(
                                      name: program.title,
                                      imageUrl: program.img,
                                      desc: program.description,
                                    ),
                                  )),
                            text: "See More",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.safeBlockHorizontal * 4,
                            ),
                          )
                      ]),
                    ),
                  ),

                FutureBuilder<Map<String, List<dynamic>>>(
                    future: progressData.getProgressAndRestDays(
                      programId: program.id.toString(),
                      totalWeeks: int.parse(program.weeks),
                      token: userToken,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          snapshot.hasError)
                        return Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.safeBlockVertical * 4),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );

                      return Column(
                        children: [
                          ...snapshot.data.keys
                              .map((weekNum) => WeekItem(
                                    weekNumber: weekNum,
                                    weekData: snapshot.data[weekNum],
                                    programId: program.id.toString(),
                                    programImage: program.img,
                                    programName: program.title,
                                    // restDays: programName == "Beginner"
                                    //     ? [2, 5, 7]
                                    //     : (programName == "Intermediate"
                                    //         ? [3, 5, 7]
                                    //         : [2, 5, 7]),
                                    // isOpened: true,
                                  ))
                              .toList(),
                        ],
                      );
                    }),
                // SizedBox(height: SizeConfig.safeBlockVertical),
                // WeekItem(
                //   weekNumber: 2,
                //   isOpened: false,
                // ),
                // SizedBox(height: SizeConfig.safeBlockVertical * 3),
                // WeekItem(
                //   weekNumber: 3,
                //   isOpened: false,
                // ),
                // SizedBox(height: SizeConfig.safeBlockVertical * 3),
                // WeekItem(
                //   weekNumber: 4,
                //   isOpened: false,
                // ),
                // SizedBox(height: SizeConfig.safeBlockVertical * 7)
              ],
            ),
            // StartButton(() {})
          ],
        ),
        backgroundColor: Color(0xFFE9E9E9));
  }
}
