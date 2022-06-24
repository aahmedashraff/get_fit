import 'package:CaptainSayedApp/screens/view_all_screen/view_all_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class WelcomeSec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended Programs",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          Container(
            child: GestureDetector(
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/Beginner.jpg",
                  width: double.infinity,
                  height: SizeConfig.safeBlockVertical * 28,
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ViewAllScreen(
                  title: "Recommended Programs",
                  programNum: 2,
                ),
              )),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  blurRadius: 4,
                  // spreadRadius: 0,
                  offset: Offset(0, SizeConfig.safeBlockVertical * .25),
                )
              ],
              //border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal),
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          Text(
            "Based on your choice, these programs are suitable for you",
            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3)
        ],
      ),
    );
  }
}
