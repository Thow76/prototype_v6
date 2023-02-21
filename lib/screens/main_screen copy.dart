import 'package:flutter/material.dart';
import 'package:prototype_v5/services/authentication/auth.dart';
import 'package:prototype_v5/utils/input_decoration_template.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    // 1
    final authUser = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      // 2
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.app_registration,
            ),
            onPressed: () {},
          ),
        ],
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
                  child: TextFormField(
                    decoration:
                        textInputDecorationLight.copyWith(hintText: 'email'),
                    style: const TextStyle(color: Colors.white),
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    controller: _emailController,
                    validator: (String? value) {
                      // conmfirm user has enetered an email
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else {
                        // call function to check email is valid
                        bool result = validateEmail(value);
                        if (result) {
                          return null;
                        } else {
                          return "Valid Email Required";
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                      decoration: textInputDecorationLight.copyWith(
                          hintText: 'password'),
                      style: const TextStyle(color: Colors.white),
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: _passwordController,
                      validator: (String? value) {
                        // conmfirm user has enetered an email
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 300,
                ),
                ElevatedButton(
                  onPressed: (() {
                    authUser.login(_emailController.text,
                        _passwordController.text, context);
                  }),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (() {
                    authUser.signup(_emailController.text,
                        _passwordController.text, context);
                  }),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
