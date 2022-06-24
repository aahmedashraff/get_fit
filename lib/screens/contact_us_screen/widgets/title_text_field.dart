import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final Function(String title) getTextFieldValue;
  final bool isForTitle;

  const TitleTextField({this.getTextFieldValue, this.isForTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: getTextFieldValue,
        cursorColor: Theme.of(context).primaryColor,
        decoration:
            InputDecoration.collapsed(hintText: isForTitle ? "Title" : "Email"),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 3,
        vertical: SizeConfig.safeBlockVertical * 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
      ),
    );
  }
}
