import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/view_program_item.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/top.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ViewAllPremiumScreen extends StatelessWidget {
  final List<ProgramModel> allPrograms;

  ViewAllPremiumScreen({this.allPrograms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        child: Column(
          children: [
            Top(),
            SizedBox(height: SizeConfig.safeBlockVertical * 4),
            Text(
              "Premium Programs",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.safeBlockHorizontal * 4),
            ),
            // SizedBox(height: SizeConfig.safeBlockVertical * 4),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, i) => ViewPrgoramItem(
                  programItem: allPrograms[i],
                ),
                itemCount: allPrograms.length,
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
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
