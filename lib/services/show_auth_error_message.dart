import 'package:flutter/material.dart';

void showErrorMessage({BuildContext context, String error, Function fun}) {
  String message;
  if (error == null)
    message = "Check your connection and try again.";
  // else if (error.contains("already in use"))
  //   message = "The email address is already in use by another account.";
  // else if (error.contains("found"))
  //   message = "There is no account for this email.";
  // else if (error.contains("wrong"))
  //   message = "The password is worng";
  else if (error.contains("subtype"))
    message = "This email is already used";
  else
    message = "Check your connection and try again.";
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("An error occured!"),
            content: Text(
              message,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  fun();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(),
                ),
                textColor: Colors.black,
                color: Theme.of(context).primaryColor,
              )
            ],
          ));
}

void showDialogMessage(
    {BuildContext context, String message, String title, Function fun}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(
              message,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (fun != null) fun();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(),
                ),
                textColor: Colors.black,
                color: Theme.of(context).primaryColor,
              )
            ],
          ));
}
