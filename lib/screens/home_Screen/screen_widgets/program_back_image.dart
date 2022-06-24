import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ProgramBackImage extends StatelessWidget {
  final url;
  ProgramBackImage(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        "$imageBase_URL/$url",
        height: SizeConfig.safeBlockVertical * 20,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      borderRadius:BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
    );
  }
}
