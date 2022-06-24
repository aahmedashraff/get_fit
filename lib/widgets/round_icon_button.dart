import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 15,
        color: Colors.white,
      ),
      onPressed: onPressed,
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        width: 25.0,
        height: 25.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}
