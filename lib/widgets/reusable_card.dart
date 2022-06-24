import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardChild, @required this.decColour});
  final Color colour;
  final Color decColour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: decColour,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
