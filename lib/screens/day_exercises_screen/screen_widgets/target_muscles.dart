import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TargetMuscles extends StatelessWidget {
  static const muscles = ["Shoulder", "Arm", "Chest"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.safeBlockVertical,
            left: SizeConfig.safeBlockHorizontal * 4,
          ),
          child: Text(
            "Target Muscles",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
            ),
          ),
        ),
        Container(
          child: ListBody(
            children: muscles
                .map((e) => ListTile(
                      leading: ClipRRect(
                        child: Image.asset(
                          "assets/images/muscle${muscles.indexOf(e)}.jpg",
                          width: SizeConfig.safeBlockHorizontal * 33.3,
                          height: SizeConfig.safeBlockVertical * 7,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal),
                      ),
                      title: Text(
                        e,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "$e Muscle",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))
                .toList(),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF4707070).withOpacity(.8),
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
          ),
          width: double.infinity,
          padding:EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical*1.5)
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
