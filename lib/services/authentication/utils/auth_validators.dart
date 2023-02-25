class AuthValidators {
  // Create error sign in sign up error messages.
  // #1
  static const String emailError = "Please provide a valid email.";
  static const String passwordError =
      "Password must be at least 8 characters long with 1 uppercase letter, and a number.";
  static const String confirmPasswordError = "Passwords do not match.";

  RegExp regExEmail =
      RegExp(r'^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$');
  //A function that validate user entered password
  String? validateEmail(String? email) {
    String validEmail = email as String;
    if (!regExEmail.hasMatch(validEmail)) return emailError;
    return null;
  }

// RegEx pattern that confirms the email conforms to a standard email structure
  RegExp regExPassword =
      RegExp(r'^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,})$');

// A function to validate user entered password
  String? validatePassword(String? pass) {
    String password = pass as String;
    if (!regExPassword.hasMatch(password)) return passwordError;
    return null;
  }

// RegEx pattern that requires a password has at least 8 characters, 1 uppercare character and 1 number

// A function to validate user entered password
  String? confirmPassword(String? val, firstPass) {
    final String firstPassword = firstPass as String;
    final String secondPassword = val as String;

    if (firstPassword.isEmpty ||
        secondPassword.isEmpty ||
        firstPassword.length != secondPassword.length) {
      return confirmPasswordError;
    }
    if (firstPassword != secondPassword) return confirmPasswordError;
    return null;
  }
}
