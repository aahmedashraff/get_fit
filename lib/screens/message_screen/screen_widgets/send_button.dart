import 'package:CaptainSayedApp/widgets/next_or_submit_button.dart';
import 'package:flutter/material.dart';


class SendButton extends StatelessWidget {
  final Function onPress;
  SendButton(this.onPress);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        NextOrSubmitButton(
          'Send',
          onPress: onPress,
        ),
      ],
    );

    //   Positioned(
    //   left: 15,
    //   child: RaisedButton(
    //     onPressed: onPress,
    //     shape: RoundedRectangleBorder(
    //       borderRadius:
    //           BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
    //     ),
    //     color: primaryColor,
    //     child: const Text(
    //       "Send",
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     ),
    //     padding: EdgeInsets.symmetric(
    //       horizontal: SizeConfig.safeBlockHorizontal * 37,
    //       vertical: SizeConfig.safeBlockVertical * 2,
    //     ),
    //   ),
    //   bottom: 5,
    // );
  }
}
