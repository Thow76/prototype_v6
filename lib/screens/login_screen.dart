import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.app_registration,
                color: Colors.white,
              ),
              onPressed: () {},
              label: const Text(''),
            ),
          ],
        ),
        body: Form(
            child: Column(
          children: <Widget>[
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (() {}), child: const Text('Login'))
          ],
        )));
  }
}
