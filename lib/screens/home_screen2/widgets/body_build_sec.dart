import 'package:CaptainSayedApp/screens/home_screen2/widgets/small_image.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/view_all_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class BodyBuildSec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4),
          child: Row(
            children: [
              Text(
                "Body Building Programs",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              InkWell(
                              child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3,
                  ),
                ),
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ViewAllScreen(
                    title: "Body Building Programs",
                    programNum: 2,
                  ),
                )),
              )
            ],
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockVertical),
        Container(
          //width: 300,
          height: SizeConfig.safeBlockVertical * 21,
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ListView(
            children: [
              for (var i = 2; i < 8; i = i + 2)
                Row(
                  children: [
                    Column(
                      children: [
                        SmallImage(),
                        SizedBox(height: SizeConfig.safeBlockVertical),
                        Text(
                          "$i Weeks",
                          style: TextStyle(
                            height: 1,
                            fontSize: SizeConfig.safeBlockVertical * 1.45,
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(
                        width: i == 8 ? 0 : SizeConfig.safeBlockHorizontal * 2)
                  ],
                ),
            ],
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4),
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
