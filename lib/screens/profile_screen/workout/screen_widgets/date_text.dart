import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class DateText extends StatelessWidget {
  final String date;
  DateText(this.date);
  @override
  Widget build(BuildContext context) {
    final joiningDate = DateTime.parse(date);
    final timeDiffrenceInDays = DateTime.now().difference(joiningDate).inDays;
    final text = timeDiffrenceInDays == 0
        ? "Today"
        : (timeDiffrenceInDays == 1
            ? "1 Day ago"
            : "$timeDiffrenceInDays Days ago");
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text,style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal*4),),
    );
  }
}
