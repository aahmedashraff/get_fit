import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/weightSlider.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Functions {
  static void getUserDateOfBirth(BuildContext context) {
    showDatePicker(
      builder: (_, ch) => Theme(
        data: ThemeData(
          primarySwatch: MaterialColor(0xFFEE6F57, {
            50: Color.fromRGBO(238, 111, 87, .1),
            100: Color.fromRGBO(238, 111, 87, .2),
            200: Color.fromRGBO(238, 111, 87, .3),
            300: Color.fromRGBO(238, 111, 87, .4),
            400: Color.fromRGBO(238, 111, 87, .5),
            500: Color.fromRGBO(238, 111, 87, .6),
            600: Color.fromRGBO(238, 111, 87, .7),
            700: Color.fromRGBO(238, 111, 87, .8),
            800: Color.fromRGBO(238, 111, 87, .9),
            900: Color.fromRGBO(238, 111, 87, 1),
          }),
        ),
        child: ch,
      ),
      context: context,
      initialDate: DateTime(1995, 1, 1),
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime.now().subtract(Duration(days: 3650)),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      Provider.of<UserData>(context, listen: false)
          .setBirthData(selectedDate.toIso8601String());
      //DateFormat("MMMM,dd yyyy")
    });
  }

  static void editUserName(BuildContext context) {
    var name = "";
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelText: "Name",
          labelStyle: TextStyle(
            height: 1.5,
            color: Theme.of(context).primaryColor,
          ),
          hintText: "Enter your Name",
        ),
        onChanged: (value) => name = value,
      ),
      btnOkText: "OK",
      btnOkOnPress: () => Provider.of<UserData>(context, listen: false)
          .saveUserFullName(name: name),
      btnOkColor: Theme.of(context).primaryColor,
    ).show();
  }

  static void editUserEmail(BuildContext context) {
    var email = "";
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelText: "Email",
          labelStyle: TextStyle(
            height: 1.5,
            color: Theme.of(context).primaryColor,
          ),
          hintText: "Enter your Email",
        ),
        onChanged: (value) => email = value,
      ),
      btnOkText: "OK",
      btnOkOnPress: () async {
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) return;
        final token = Provider.of<UserData>(context, listen: false).userToken;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        try {
          await updateEmailOrPass(
            isEmail: true,
            token: token,
            updated: email,
          );
          Navigator.pop(context);
        } catch (e) {
          
        }
      },
      btnOkColor: Theme.of(context).primaryColor,
    ).show();
  }

  static void editUserPassword(BuildContext context) {
    var pass = "";
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelText: "password",
          labelStyle: TextStyle(
            height: 1.5,
            color: Theme.of(context).primaryColor,
          ),
          hintText: "Enter your new password",
        ),
        onChanged: (value) => pass = value,
      ),
      btnOkText: "OK",
      btnOkOnPress: () async {
        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
            .hasMatch(pass)) return;
        final token = Provider.of<UserData>(context, listen: false).userToken;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        try {
          await updateEmailOrPass(
            isEmail: false,
            token: token,
            updated: pass,
          );
          Navigator.pop(context);
        } catch (e) {}
      },
      btnOkColor: Theme.of(context).primaryColor,
    ).show();
  }

  static void changeLocation(BuildContext context) {
    const _countries = <String>[
      "Algeria",
      "Bahrain",
      "Egypt",
      "Iraq",
      "Jordan",
      "Kuwait",
      "Lebanon",
      "Libya",
      "Morocco",
      " Oman",
      "Palestine",
      "Qatar",
      "Saudi Arabia",
      "Sudan",
      "Syria",
      "Tunisia",
      "United Arab Emirates",
    ];
    var _selctedCountryIndex = 0;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: Container(
        height: SizeConfig.safeBlockVertical * 27,
        child: CupertinoPicker(
          itemExtent: 50,
          onSelectedItemChanged: (index) => _selctedCountryIndex = index,
          children: _countries.map((e) => Text(e)).toList(),
        ),
      ),
      btnOkText: "OK",
      btnOkOnPress: () => Provider.of<UserData>(context, listen: false)
          .saveUserContry(_countries[_selctedCountryIndex]),
      btnOkColor: Theme.of(context).primaryColor,
    ).show();
  }

  static void editUserWeight(BuildContext context) {
    var weight = 0;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: WeightSlider(
        selectWeight: (value) {
          weight = value;
        },
      ),
      btnOkText: "OK",
      btnOkOnPress: () {
        Provider.of<UserData>(context, listen: false).setUserWeight(weight);
      },
      btnOkColor: Theme.of(context).primaryColor,
    ).show();
  }

  static void afterResetPass(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            body: Center(
              child: const Text(
                "A message has been sent to your email, check it to reset your password!",
                textAlign: TextAlign.center,
              ),
            ),
            btnOkText: "OK",
            btnOkOnPress: () {},
            btnOkColor: Theme.of(context).primaryColor)
        .show();
  }

  static void errorMessage(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            title: "An error occurred!",
            desc: "Chek your connection and try again!",
            btnOkText: "OK",
            btnOkOnPress: () {},
            btnOkColor: Theme.of(context).primaryColor)
        .show();
  }
}
