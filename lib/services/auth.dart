import 'dart:convert';

import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  Future<void> signUpwithEmailAndPass({
    String email,
    String pass,
    String fullName,
    Map<String, dynamic> userData,
    BuildContext context,
  }) async {
    var dio = Dio();
    final formData = FormData.fromMap({
      "name": fullName.substring(0, fullName.indexOf(" ")),
      "last_name": fullName.substring(fullName.indexOf(" ") + 1),
      "email": email,
      "password": pass,
      "date_of_birth": "2000-1-1",
      "image": await MultipartFile.fromFile(userData["image"]),
      "gender": userData["gender"].toString(),
      "height": "180",
      "weight": "80",
      "level_id": userData["level"].toString(),
      "goal_id": userData["goal"].toString(),
      "location_id": "2"
    });

    // final auth = FirebaseAuth.instance;

    try {
      final response = await dio.post("$api_URL/register", data: formData);
      String token = response.data["token"];
      Provider.of<UserData>(context, listen: false)
          .updateToken(newToken: token);
      final pref = await SharedPreferences.getInstance();
      pref.setString("token", token);
      notifyListeners();
      // if(response.data.runtimeType)
      // await auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: pass,
      // );
    } catch (e) {
      throw e;
    }
  }

  Future<void> signInWithEmailAndPass({
    String email,
    String pass,
    BuildContext context,
  }) async {
    Dio dio = Dio();
    final formData = FormData.fromMap({
      "email": email,
      "password": pass,
    });

    try {
      final response = await dio.post("$api_URL/login", data: formData);
      String token = response.data["access_token"];
      if (token == null) throw 'Error';
      Provider.of<UserData>(context, listen: false)
          .updateToken(newToken: token);
      final pref = await SharedPreferences.getInstance();
      pref.setString("token", token);
      notifyListeners();
      // await auth.signInWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      print(e.toString());
      print(email);
      print(pass);

      throw e;
    }
  }

  Future<void> signOut({BuildContext context}) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.get("$api_URL/logout");
      String message = response.data["message"];
      print(response.data["message"]);
      print("...........................");
      if (message.contains("Successfully")) {
        Provider.of<UserData>(context, listen: false).updateToken();
        await pref.clear();
        Provider.of<UserData>(context);
        pref.setString("token", "");
        notifyListeners();
      }
      // // final facebookSignIn = FacebookLogin();
      // if (await facebookSignIn.isLoggedIn) {
      //   await facebookSignIn.logOut();
      // }

      try {
        await GoogleSignIn().disconnect();
      } catch (e) {}
    } catch (e) {}

    // final auth = FirebaseAuth.instance;
    // final user = auth.currentUser;
    // final facebookSignIn = FacebookLogin();

    // if (user.providerData[0].providerId.contains("google")) {
    //   await GoogleSignIn().disconnect();
    // } else if (await facebookSignIn.isLoggedIn) {
    //   await facebookSignIn.logOut();
    // }
    // print(await facebookSignIn.isLoggedIn);
    // auth.signOut();
  }

//--------------------------------------------------------------

  Future<void> googleSignIn({BuildContext context}) async {
    // final auth = FirebaseAuth.instance;
    try {
      final googleSignIn = GoogleSignIn();
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final googleSignInAuth = await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuth.idToken,
          accessToken: googleSignInAuth.accessToken,
        );
        final response = await http.post(
          Uri.parse("$api_URL/login/google/callback"),
          body: {
            "email": googleSignInAccount.email,
            "provider_id": googleSignInAuth.idToken
          },
        );

        final token = json.decode(response.body)["access_token"] as String;
        if (token == null) throw 'Error';
        Provider.of<UserData>(context, listen: false)
            .updateToken(newToken: token);
        final pref = await SharedPreferences.getInstance();
        pref.setString("token", token);
        notifyListeners();

        // await auth.signInWithCredential(credential);
        print(token);
        print("google fddffddffdfdfdffd");
        await Provider.of<UserData>(context, listen: false)
            .saveUserFullName(name: googleSignInAccount.displayName);

        await Provider.of<UserData>(context, listen: false)
            .setUserEmail(googleSignInAccount.email);
      } else {
        throw "Error";
      }

      // final user = auth.currentUser;
      // print(auth.currentUser.email);
      // print(auth.currentUser.providerData[0]);
      // print("---------");
      // print(auth.currentUser.displayName ?? "msa");
      // print(auth.currentUser.providerData.toString());
      // //   try {

    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // Future<void> facebookSignIn(BuildContext context) async {
  //   // final auth = FirebaseAuth.instance;
  //   try {
  //     final facebookSignIn = FacebookLogin();
  //     final result = await facebookSignIn.logIn(['email']);
  //
  //     final token = result.accessToken.userId;
  //     if (result.status == FacebookLoginStatus.loggedIn) {
  //       // final credential = FacebookAuthProvider.credential(token);
  //       final graphResponse = await http.get(
  //         Uri.parse(
  //           'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}',
  //         ),
  //       );
  //
  //       final userEmail = json.decode(graphResponse.body)["email"];
  //       final response = await http.post(
  //         (Uri.parse(
  //           "$api_URL/login/facebook/callback",
  //         )),
  //         body: {"email": userEmail ?? token, "provider_id": token},
  //       );
  //       final userToken = json.decode(response.body)["access_token"] as String;
  //       if (token == null) throw 'Error';
  //       Provider.of<UserData>(context, listen: false)
  //           .updateToken(newToken: userToken);
  //       final pref = await SharedPreferences.getInstance();
  //       pref.setString("token", userToken);
  //       notifyListeners();
  //
  //       // await auth.signInWithCredential(credential);
  //       await Provider.of<UserData>(context, listen: false)
  //           .saveUserFullName(name: json.decode(graphResponse.body)["name"]);
  //       await Provider.of<UserData>(context, listen: false)
  //           .setUserEmail(json.decode(graphResponse.body)["email"] ?? "_____");
  //     } else {
  //       throw "Error";
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<void> restPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse(
          "$api_URL/forgot-password",
        ),
        body: {"email": email},
      );
      final data = json.decode(response.body)["message"] as String;
      if (!data.contains("successfully")) {
        throw "Error";
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
