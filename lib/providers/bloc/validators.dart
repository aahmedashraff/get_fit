import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    var isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    isEmailValid ? sink.add(email) : sink.addError("Enter a valid Email");
  });
}

final validatePassword =
    StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
  var isPassValid = pass.length > 3;
  isPassValid
      ? sink.add(pass)
      : sink.addError("Pass must be at least 4 characters");
});

final validateUsreName = StreamTransformer<String, String>.fromHandlers(
    handleData: (userName, sink) {
  userName.trim().length > 4
      ? sink.add(userName)
      : sink.addError("User name must be 5 letters at least");
});

final validateFullName = StreamTransformer<String, String>.fromHandlers(
    handleData: (userName, sink) {
  userName.trim().length > 3 && userName.contains(" ")
      ? sink.add(userName)
      : sink.addError("Enter your first and last name.");
});
