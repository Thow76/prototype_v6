import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Validators {
  RegExp regExEmail =
      RegExp(r'/^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$/');
  //A function that validate user entered password
  bool validateEmail(String email) {
    String validEmail = email.trim();
    if (regExEmail.hasMatch(validEmail)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp regExPassword = RegExp(r'/^[\d\w@-]{8,20}$/i,');
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String password = pass.trim();
    if (regExPassword.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }
}
