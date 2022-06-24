import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userData = Provider.of<UserData>(context);
    var _gender = _userData.userGender;
    return PopupMenuButton(
      itemBuilder: (_) => [
        PopupMenuItem(
          child: const Text("Male"),
          value: "Male",
        ),
        PopupMenuItem(
          child: const Text("Female"),
          value: "Female",
        )
      ],
      child: const Text("Edit",style: TextStyle(color: Colors.white),),
      onSelected: (String value) {
        if (value.compareTo(_gender) != 0) {
          _userData.selectGender();
        }
      },
    );
  }
}
