import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/gender_info.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class UserInfoListTileItem extends StatelessWidget {
  final String title;
  final String subtitle;

  final String assetName;
  final Function onPress;

  const UserInfoListTileItem({
    @required this.title,
    this.subtitle,
    this.assetName,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1),
      child: ListTile(
        leading: Image.asset(assetName),
        title: Text(
          title,
          style: TextStyle(),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                ),
              ),
        trailing: title == "Gender" ? GenderInfo() : null,
        onTap: onPress,
      ),
    );
  }
}
