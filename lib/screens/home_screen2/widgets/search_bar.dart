import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final bool isComingFromSearchScreen;
  final void Function(String title) getTextFieldValue;

  const SearchBar({Key key,this.getTextFieldValue, this.isComingFromSearchScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.transparent,
      child: Container(
        child: TextField(autofocus: isComingFromSearchScreen,
          onChanged: (value)=>getTextFieldValue(value),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration.collapsed(hintText: "Search"),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 3,
         vertical: SizeConfig.safeBlockVertical*.5 ,
        ),
        margin:EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 15,
          vertical: SizeConfig.safeBlockVertical * 2,
        ),
        decoration: BoxDecoration(
          border:Border.all(color:Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
        ),
      ),
    );
  }
}