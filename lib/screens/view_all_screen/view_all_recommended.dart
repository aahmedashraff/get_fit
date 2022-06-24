import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/view_program_item.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/top.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewRecommendedProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProgramModel>>(
          future: getRecommendedPrograms(
              token: Provider.of<UserData>(context, listen: false).userToken),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting||snapshot.hasError)
              return Center(child: CircularProgressIndicator());
            return Padding(
              child: Column(
                children: [
                  Top(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 4),
                  Text(
                    "Recommended Programs",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                    ),
                  ),
                  // SizedBox(height: SizeConfig.safeBlockVertical * 4),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, i) => ViewPrgoramItem(
                        programItem: snapshot.data[i],
                      ),
                      itemCount: snapshot.data.length,
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
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
