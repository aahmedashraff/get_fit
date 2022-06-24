import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class WorkoutImageItem extends StatelessWidget {
  final String name;
  final String type;
  WorkoutImageItem({this.name, this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            child: Image.asset(
              "assets/images/$name.jpg",
              height: SizeConfig.safeBlockVertical * 18,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: FittedBox(
                              child: RichText(
                  text: TextSpan(
                    text: "$name ",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: SizeConfig.safeBlockHorizontal * 9,
                    ),
                    children: [
                      TextSpan(
                        text: name == "Fat" ? " Burning" : type,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 9,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, SizeConfig.safeBlockVertical * .5),
          )
        ],
      ),
    );
  }
}
