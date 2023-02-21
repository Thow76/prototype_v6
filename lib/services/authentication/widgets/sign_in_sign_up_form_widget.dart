import 'package:flutter/material.dart';
import 'package:prototype_v5/services/authentication/auth.dart';
import 'package:prototype_v5/services/authentication/utils/auth_validators.dart';
import 'package:prototype_v5/widgets/input_field_widget.dart';

import 'package:provider/provider.dart';

class SignInUpForm extends StatefulWidget {
  const SignInUpForm({Key? key}) : super(key: key);

  @override
  State<SignInUpForm> createState() => _SignInUpFormState();
}

class _SignInUpFormState extends State<SignInUpForm> {
  // Define Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Instantiate Validators
  late AuthValidators authValidators = AuthValidators();

  // Controllers
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  // Create focus nodes
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  // Obscure password
  bool hidePassword = true;

  // Toggle between login and sign-up
  bool toggleScreen = false;

  // Instantiate text editing controllers and focus nodes with initState
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  // Dispose of text editing controllers and focus nodes with dispose
  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  // Create function to toggle password visibility
  void toggleHidePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  // RegExp regExEmail =
  //     RegExp(r'/^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$/');
  // //A function that validate user entered password
  // bool validateEmail(String email) {
  //   String validEmail = email.trim();
  //   if (regExEmail.hasMatch(validEmail)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // RegExp regExPassword = RegExp(r'/^[\d\w@-]{8,20}$/i,');
  // //A function that validate user entered password
  // bool validatePassword(String pass) {
  //   String password = pass.trim();
  //   if (regExPassword.hasMatch(password)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // RegExp regExConfirmPassword = RegExp(r'/^[\d\w@-]{8,20}$/i,');
  // //A function that validate user entered password
  // bool confirmPassword(String pass) {
  //   String confirmPassword = pass.trim();
  //   if (regExConfirmPassword.hasMatch(confirmPassword) &&
  //       _passwordController == _confirmPasswordController) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Submit form will take AuthStateProvider, and BuildContext
// #1
  void _submitForm(AuthService authService, BuildContext context) async {
    // Check if the form and its input are valid
    // #2
    final isValid = _formKey.currentState!.validate();

    // Trim the inputs to remove extra spaces around them
    // #3
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // if the form is valid
    // #4
    if (isValid) {
      // Save current state if form is valid
      _formKey.currentState!.save();

      // Try Sign In Or Register baed on if its register Auth Mode or not
      // #5
      if (toggleScreen) {
        authService.signup(email, password, context);
      }
    } else {
      authService.login(email, password, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1
    final authUser = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      // 2
      appBar: AppBar(
        title: const Text('Home'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.app_registration,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      // 3
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  child: DynamicInputWidget(
                      // decoration:
                      //     textInputDecorationLight.copyWith(hintText: 'email'),
                      // style: const TextStyle(color: Colors.white),
                      controller: _emailController,
                      obscureText: false,
                      focusNode: emailFocusNode,
                      toggleObscureText: null,
                      prefIcon: const Icon(Icons.email, color: Colors.white),
                      labelText: "Email",
                      // autofocus: false,
                      // keyboardType: TextInputType.emailAddress,
                      // textCapitalization: TextCapitalization.none,
                      // autocorrect: false,
                      textInputAction: TextInputAction.next,
                      isNonPasswordField: true,
                      validator: authValidators.validateEmail
                      // (String? value) {
                      //   // conmfirm user has enetered an email

                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter a valid email';
                      //   } else {
                      //     // call function to check email is valid
                      //     bool result = validateEmail(value);
                      //     if (result) {
                      //       return null;
                      //     } else {
                      //       return "Valid Email Required";
                      //     }
                      //   }
                      // },
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: DynamicInputWidget(
                    // decoration: textInputDecorationLight.copyWith(
                    //     hintText: 'password'),
                    // style: const TextStyle(color: Colors.white),
                    // autofocus: false,
                    controller: _passwordController,
                    obscureText: hidePassword,
                    focusNode: passwordFocusNode,
                    toggleObscureText: toggleHidePassword,
                    prefIcon: const Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    labelText: "Password",
                    // keyboardType: TextInputType.visiblePassword,
                    // textCapitalization: TextCapitalization.none,
                    // autocorrect: false,
                    textInputAction: toggleScreen
                        ? TextInputAction.next
                        : TextInputAction.done,
                    isNonPasswordField: false,
                    validator: authValidators.validatePassword,
                    // (String? value) {
                    //   // conmfirm user has enetered a password
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter a password';
                    //   } else {
                    //     // call function to check password is valid
                    //     bool result = validatePassword(value);
                    //     if (result) {
                    //       return null;
                    //     } else {
                    //       return "Valid Email Required";
                    //     }
                    //   }
                    // }
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: toggleScreen ? 65 : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: toggleScreen ? 1 : 0,
                    child: SizedBox(
                      height: 30,
                      width: 300,
                      child: DynamicInputWidget(
                        controller: _confirmPasswordController,
                        focusNode: confirmPasswordFocusNode,
                        isNonPasswordField: false,
                        labelText: "Confirm Password",
                        obscureText: hidePassword,
                        prefIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.done,
                        toggleObscureText: toggleHidePassword,
                        validator: (val) => authValidators.confirmPassword(
                            val, _confirmPasswordController.text),
                        // (String? value) {
                        //   // conmfirm user has enetered a password
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please confirm password';
                        //   } else {
                        //     // call function to check password is valid
                        //     bool result = confirmPassword(value);
                        //     if (result) {
                        //       return null;
                        //     } else {
                        //       return "Password does not match";
                        //     }
                        //   }
                        // }
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: toggleScreen ? 1 : 0,
                  child: const SizedBox(
                    height: 20,
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                ElevatedButton(
                  onPressed: () {
                    // call _submitForm on tap
                    _submitForm(authUser, context);
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8.0),
                  ),
                  child: Text(
                    toggleScreen ? 'Sign Up' : 'Sign In',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                // ElevatedButton(
                //   onPressed: (() {
                //     authUser.login(_emailController.text,
                //         _passwordController.text, context);
                //   }),
                //   child: const Text('Login'),
                // ),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        toggleScreen
                            ? "Already have an account?"
                            : "Don't have an account yet?",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          onPressed: () =>
                              setState(() => toggleScreen = !toggleScreen),
                          child: Text(
                            toggleScreen ? "Sign In" : "Sign Up",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
