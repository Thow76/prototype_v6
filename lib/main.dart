import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prototype_v5/firebase_options.dart';
import 'package:prototype_v5/screens/login_screen.dart';
import 'package:prototype_v5/screens/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Handle error for Firebase.initializeApp

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme().light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const LoginScreen(),
    );
  }
}
