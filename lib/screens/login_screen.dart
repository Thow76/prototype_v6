import 'package:flutter/material.dart';
import 'package:prototype_v5/screens/utils/constants.dart';

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
          IconButton(
            icon: const Icon(
              Icons.person,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration:
                      textInputDecorationLight.copyWith(hintText: 'email'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration:
                      textInputDecorationLight.copyWith(hintText: 'password'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (() {}),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
