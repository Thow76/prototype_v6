import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prototype_v5/firebase_options.dart';
import 'package:prototype_v5/screens/main_screen.dart';
import 'package:prototype_v5/services/authentication/widgets/sign_in_sign_up_form_widget.dart';
import 'package:prototype_v5/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:prototype_v5/services/authentication/auth.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          lazy: false,
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const MainScreen()),
    );
  }
}
