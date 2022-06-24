import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final Function onPress;
  SendButton(this.onPress);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical),
      child: RaisedButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
        ),
        color: Theme.of(context).primaryColor,
        child: const Text(
          "Send",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 37,
          vertical: SizeConfig.safeBlockVertical * 2,
        ),
      ),
    );
  }
}
