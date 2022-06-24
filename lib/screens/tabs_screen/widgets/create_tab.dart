import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class CreateTab extends StatelessWidget {
  final String title;

  const CreateTab({this.title});
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
            ),
            textAlign: TextAlign.center,
            //softWrap: false,
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: SizeConfig.safeBlockHorizontal * 30,
        ),
      ),
    );
  }
}
