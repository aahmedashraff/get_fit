import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/program_item.dart';
import 'package:CaptainSayedApp/screens/program_screen/program_Screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ViewPrgoramItem extends StatelessWidget {
  final ProgramModel programItem;

  const ViewPrgoramItem({Key key, this.programItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          ProgramItem(
            program: programItem,
          ),
          Positioned.fill(
            child: GestureDetector(
              child: Container(
                color: Colors.transparent,
                // width: double.infinity,
                // height: double.infinity,
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProgramScreen(
                            program: programItem,
                          ))),
            ),
          ),
          Positioned(
            child: FlatButton(
              onPressed: () {
                resetProgress(
                  context: context,
                  programId: programItem.id,
                );
              },
              child: const Text(
                "Reset",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
              ),
            ),
            bottom: SizeConfig.safeBlockVertical * 0,
            right: SizeConfig.safeBlockHorizontal * 2,
          )
        ]),
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.safeBlockVertical * 1.5,
            left: SizeConfig.safeBlockHorizontal,
            top: SizeConfig.safeBlockVertical * .25,
          ),
          child: Column(
            children: [
              Text(
                programItem.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${programItem.weeks} weeks",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
