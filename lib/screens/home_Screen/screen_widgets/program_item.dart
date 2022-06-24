import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/fill_color_layer.dart';
import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/program_back_image.dart';
import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/program_text.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProgramItem extends StatelessWidget {
  final ProgramModel program;

  const ProgramItem({
    @required this.program,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          child: Stack(
            children: [
              ProgramBackImage(program.img),
              FillColorLayer(),
              ProgramText(program.title),
              // if (isClosedProgram) FillColorLayer(),
              // if (isClosedProgram)
              //   Positioned.fill(
              //     child: Align(
              //       alignment: Alignment.center,
              //       child: Text(
              //         "Soon",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: SizeConfig.safeBlockHorizontal * 25,
              //         ),
              //       ),
              //     ),
              //   ),
              // Positioned(
              //   child: FlatButton(
              //     onPressed: () => resetButtonDialog(context),
              //     child: const Text(
              //       "Reset",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     color: Theme.of(context).primaryColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius:
              //           BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
              //     ),
              //   ),
              //   bottom: SizeConfig.safeBlockVertical * 2,
              //   right: SizeConfig.safeBlockHorizontal * 3,
              // )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, -SizeConfig.safeBlockVertical * .25),
                )
              ]),
          //margin: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical*.5 ),
        ),
        onTap: () {
         
        }
        //  () {
        //     UserData.addTodUserWorkout(
        //         "$programName Level ${DateTime.now().toIso8601String()}");
        //     Provider.of<UserData>(context, listen: false)
        //         .updateCurrentProgramName(programName);
        //     Navigator.of(context).pushNamed(
        //       ProgramScreen.screenName,
        //       arguments: programName,
        //     );
        //   },
        );
  }

  // void resetButtonDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             title: const Text("Are you sure?"),
  //             content:
  //                 const Text("Do you want to reset progress for this program?"),
  //             actions: [
  //               FlatButton(
  //                 onPressed: () {
  //                   Provider.of<ProgramProgress>(context, listen: false)
  //                       .resetProgram(programName);
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text("Yes"),
  //                 textColor: Theme.of(context).primaryColor,
  //               ),
  //               FlatButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: const Text("No"),
  //                 textColor: Theme.of(context).primaryColor,
  //               )
  //             ],
  //           ));
  // }
}
