import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ImageOfExercise extends StatelessWidget {
  final String imageUrl;
  ImageOfExercise(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: Image.network(
          "$imageBase_URL/$imageUrl",
          height: SizeConfig.safeBlockVertical * 25,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 5),
          bottomRight: Radius.circular(
            SizeConfig.safeBlockHorizontal * 5,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              SizeConfig.safeBlockHorizontal * 5,
            ),
            bottomRight: Radius.circular(
              SizeConfig.safeBlockHorizontal * 5,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 8,
              spreadRadius: 8,
              offset: Offset(0, SizeConfig.safeBlockVertical * .25),
            )
          ]),
    );
  }
}
