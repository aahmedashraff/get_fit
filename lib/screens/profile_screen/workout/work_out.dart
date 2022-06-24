
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  static const screenName = "work-out-screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: FutureBuilder<List<String>>(
      //   future: UserData.getUserWorkOut(),
      //   builder: (_, snap) => snap.connectionState == ConnectionState.waiting
      //       ? CircularProgressIndicator()
      //       : ListView.builder(
      //           itemBuilder: (_, i) => Padding(
      //             padding: EdgeInsets.symmetric(
      //                 horizontal: SizeConfig.safeBlockHorizontal * 6),
      //             child: Column(
      //               children: [
      //                 DateText(snap.data.reversed.toList()[i].split(" ")[2]),
      //                 WorkoutImageItem(
      //                   name: snap.data.reversed.toList()[i].split(" ")[0],
      //                   type: snap.data.reversed.toList()[i].split(" ")[1],
      //                 ),
      //                 SizedBox(height: SizeConfig.safeBlockVertical*.6),
      //               ],
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //             ),
      //           ),
      //           itemCount: snap.data.length,padding: EdgeInsets.all(0),
      //         ),
      // ),
      height:SizeConfig.screenHeight * 60.65 / 100,
    );
  }
}
