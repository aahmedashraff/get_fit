import 'package:CaptainSayedApp/providers/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _emailStream = BehaviorSubject<String>.seeded("");
  final _passStream = BehaviorSubject<String>.seeded("");
  final _userNameStream = BehaviorSubject<String>.seeded("");
  final _fullNameStream = BehaviorSubject<String>.seeded("");

  // streams for sign in page
  final _signInEmailStream = BehaviorSubject<String>.seeded("");
  final _signInPassStream = BehaviorSubject<String>.seeded("");

  //stream for reset email page
  final _resetEmailStream = BehaviorSubject<String>.seeded("");
  //-------------------------------------------------------------------

  // get streams' value
  String get getEmail => _emailStream.value;
  String get getPass => _passStream.value;
  String get getFullName => _fullNameStream.value;
  String get getSignInEmail => _signInEmailStream.value;
  String get getSignInPass => _signInPassStream.value;
  String get getResetPassEmail => _resetEmailStream.value;

  //apply validation on streams
  Stream<String> get email => _emailStream.stream.transform(validateEmail);
  Stream<String> get password => _passStream.stream.transform(validatePassword);
  Stream<String> get userName =>
      _userNameStream.stream.transform(validateUsreName);
  Stream<String> get fullName =>
      _fullNameStream.stream.transform(validateFullName);
  Stream<String> get signInEmail =>
      _signInEmailStream.stream.transform(validateEmail);
  Stream<String> get signInPass =>
      _signInPassStream.stream.transform(validatePassword);

  Stream<String> get resetEmail =>
      _resetEmailStream.stream.transform(validateEmail);
  //--------------------------------------------------------

  //update sign up page streams' data
  void updateEmail(String email) => _emailStream.sink.add(email);
  void updatePass(String pass) => _passStream.sink.add(pass);
  void updateUserName(String userName) => _userNameStream.sink.add(userName);
  void updateFullName(String fullName) => _fullNameStream.sink.add(fullName);

  //update sign in page streams' data
  void updateSignInEmail(String email) => _signInEmailStream.sink.add(email);
  void updateSignInPass(String pass) => _signInPassStream.sink.add(pass);

  // update reset email
  void updateResetPasswordEmail(String email) => _resetEmailStream.add(email);

  //----------------------------------------------------------

  //validation for sign up
  Stream<bool> get validateSubmitionForSignUp {
    print(_emailStream.value);
    return Rx.combineLatest4(
        email, password, userName, fullName, (a, b, c, d) => true);
  }

  //validation fro sign in
  Stream<bool> get validateSubmitionForLogIn {
    return Rx.combineLatest2(signInEmail, signInPass, (a, b) => true);
  }
  //------------------------------------------------

  void dispose() {
    _emailStream.close();
    _passStream.close();
    _userNameStream.close();
    _fullNameStream.close();
    _signInEmailStream.close();
    _signInPassStream.close();
    
  }

  void disposeRestEmailStream() => _resetEmailStream.close();

  void resetStreamsValue() {
    updateEmail("");
    updatePass("");
    updateUserName("");
    updateFullName("");
    updateSignInEmail("");
    updateSignInPass("");
  }
}
