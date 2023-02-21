class AuthValidators {
  // Create error sign in sign up error messages.
  // #1
  static const String emailError = "Please provide a valid email.";
  static const String passwordError =
      "Password must be at least 8 charaters long with 1 uppercase letter, and a number.";
  static const String confirmPasswordError = "Passwords do not match.";

  RegExp regExEmail =
      RegExp(r'/^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$/');
  //A function that validate user entered password
  String? validateEmail(String? email) {
    String validEmail = email as String;
    if (!regExEmail.hasMatch(validEmail)) return emailError;
    return null;
  }

// RegEx pattern that confirms the email conforms to a standard email structure
  RegExp regExPassword = RegExp(r'/^[\d\w@-]{8,20}$/i,');

// A function to validate user entered password
  String? validatePassword(String? pass) {
    String password = pass as String;
    if (!regExPassword.hasMatch(password)) return passwordError;
    return null;
  }

// RegEx pattern that requires a password has at least 8 characters, 1 uppercare character and 1 number
  RegExp regExConfirmPassword = RegExp(r'/^[\d\w@-]{8,20}$/i,');

// A function t0 validate user entered password
  String? confirmPassword(String? val, firstPass) {
    final String firstPassword = firstPass as String;
    final String secondPassword = val as String;

    String confirmPassword = val;
    if (!regExConfirmPassword.hasMatch(confirmPassword) ||
        firstPassword != secondPassword) return confirmPasswordError;
    return null;
  }
}
