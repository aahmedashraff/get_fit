import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class RoundInfo extends StatelessWidget {
  final String roundTitle;
  final String roundRep;

  const RoundInfo({ this.roundTitle, this.roundRep}) ;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            roundTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.cached),
          Text(roundRep)
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical,
        horizontal: SizeConfig.safeBlockHorizontal * 4,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFE9E9E9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 2,
            offset: Offset(0, SizeConfig.safeBlockVertical * .5),
          ),
        ],
      ),
    );
  }
}
