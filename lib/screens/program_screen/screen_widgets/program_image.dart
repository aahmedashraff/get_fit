import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/screen_widgets/back_button.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProgramImage extends StatelessWidget {
  final String programName;
  final bool isForProgramInfo;
  final String imageUrl;
  ProgramImage({this.programName, this.isForProgramInfo,this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              "$imageBase_URL/$imageUrl",
              height: SizeConfig.safeBlockVertical * 30,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 2),
              bottomRight: Radius.circular(
                SizeConfig.safeBlockHorizontal * 2,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    SizeConfig.safeBlockHorizontal * 2,
                  ),
                  bottomRight: Radius.circular(
                    SizeConfig.safeBlockHorizontal * 2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "$programName",
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: SizeConfig.safeBlockHorizontal * 10.5,
                  ),
                  // children: [
                  //   TextSpan(
                  //     text: programName == "Fat" ? " Burning" : " Level",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: SizeConfig.safeBlockHorizontal * 10.5,
                  //       //fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ],
                ),
              ),
              alignment: Alignment.center,
              width: SizeConfig.screenWidth,
            ),
            bottom: SizeConfig.safeBlockVertical *7,
          ),
          //  if(!isForProgramInfo) Positioned(
          //     child: Consumer<ProgramProgress>(
          //       builder: (_, p, c) => FutureBuilder<List<int>>(
          //           future: Future.wait([
          //             ProgramProgress.totalExercisesInProgram(
          //                 programName, context),
          //             ProgramProgress.getProgramTotalProgress(programName)
          //           ]),
          //           builder: (_, snap) {
          //             if (snap.connectionState == ConnectionState.waiting)
          //               return Container();
          //             print("${snap.data[1]}/${snap.data[0]}");
          //             return Text(
          //               "${(snap.data[1] / snap.data[0] * 100).toInt()}%",
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: SizeConfig.safeBlockHorizontal * 3.5,
          //               ), //57
          //             );
          //           }),
          //     ),
          //     bottom: SizeConfig.safeBlockVertical * 2,
          //     right: SizeConfig.safeBlockHorizontal * 15,
          //   ),
          MyBackButton()
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            SizeConfig.safeBlockHorizontal * 2,
          ),
          bottomRight: Radius.circular(
            SizeConfig.safeBlockHorizontal * 2,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, SizeConfig.safeBlockVertical * .5),
          )
        ],
      ),
    );
  }
}
