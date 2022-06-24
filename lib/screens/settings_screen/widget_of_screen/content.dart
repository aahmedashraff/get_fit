import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/check_box_item.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/functions.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/user_info_listTile_item.dart';
import 'package:CaptainSayedApp/screens/welcome_screen.dart';
import 'package:CaptainSayedApp/services/auth.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    return Column(
      children: [
        UserInfoListTileItem(
          title: userData.userFullName ?? "Insert your Name",
          onPress: () => Functions.editUserName(context),
        ),
        Divider(color: Colors.white),
        UserInfoListTileItem(
          title: userData.userEmail ?? "ــ",
          onPress: () {
            try {
              Functions.editUserEmail(context);
            } catch (e) {}
          },
        ),
        Divider(color: Colors.white),
        UserInfoListTileItem(
          title: "Change Password",
          onPress: () async {
            try {
              Functions.editUserPassword(context);
            } catch (e) {
              Functions.errorMessage(context);
              return;
            }
            // Functions.afterResetPass(context);
          },
        ),
        Divider(color: Colors.white),
        UserInfoListTileItem(
          title: "Gender",
          subtitle: userData.userGender,
          onPress: () {},
        ),
        Divider(color: Colors.white),
        UserInfoListTileItem(
          title: "Weight",
          subtitle: userData.userWeight,
          onPress: () => Functions.editUserWeight(context),
        ),
        Divider(color: Colors.white),
        UserInfoListTileItem(
          title: "Date of birth",
          subtitle: DateFormat("MMMM,dd yyyy")
              .format(DateTime.parse(userData.userBithDate)),
          onPress: () => Functions.getUserDateOfBirth(context),
        ),
        Divider(color: Colors.white),
        UserInfoListTileItem(
          title: "Location",
          subtitle: userData.userCountry,
          onPress: () => Functions.changeLocation(context),
        ),
        Divider(color: Colors.grey),
        CheckBoxItem(
          intiallySelected: true,
          title: "Turn on notifications",
        ),
        CheckBoxItem(
          intiallySelected: false,
          title: "Automatic running exercises",
        ),
        Divider(color: Colors.white),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 5,
          ),
          child: ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              visualDensity: VisualDensity(vertical: -4),
              onTap: () async {
                try {
                  await Provider.of<Auth>(context, listen: false)
                      .signOut(context: context);
                  print("410");
                } on Exception {
                  return;
                }
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => WelcomeScreen()),
                    (_) => false);
              }),
        ),
      ],
    );
  }
}
