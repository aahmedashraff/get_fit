import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final void Function(String title) getTextFieldValue;

  const TitleTextField({this.getTextFieldValue});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        height: 80,
        child: TextField(
          onChanged: (value) => getTextFieldValue(value),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffix: ImageIcon(
              AssetImage('assets/images/pen (2).png'),
            ),
            hintText: "Complaint or Inquiry Address",
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 3,
          vertical: SizeConfig.safeBlockVertical * 2,
        ),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
          border: Border.all(
            color: isDark ? Colors.transparent : Colors.grey.shade50,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
