import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class DetailsOfExercise extends StatelessWidget {
  final String arabicDetails;
  final String englishDetails;
  DetailsOfExercise(this.arabicDetails, this.englishDetails);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              englishDetails.isEmpty
                  ? "Try to do the exercise as shown in the video."
                  : "$englishDetails $englishDetails $englishDetails $englishDetails ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 5),
            ),
            width: SizeConfig.safeBlockHorizontal * 100,
            padding: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 4,
              0,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockVertical * 2.5,
            ),
          ),
          Container(
            child: Text(
              arabicDetails.isEmpty
                  ? "حاول تنفيذ التمرين بالطريقة الموضحة بالفيديو."
                  : "$arabicDetails $arabicDetails $arabicDetails $arabicDetails ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5),
            ),
            width: SizeConfig.safeBlockHorizontal * 100,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4,
            ),
          )
        ],
      ),
    );
  }
}
