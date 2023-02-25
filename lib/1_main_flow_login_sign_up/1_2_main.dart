// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:prototype_v5/firebase_options.dart';
// import 'package:prototype_v5/models/learners/learner.dart';
// import 'package:prototype_v5/screens/learner/learner_home_screen.dart';
// import 'package:prototype_v5/screens/main_screen.dart';
// import 'package:prototype_v5/utils/app_theme.dart';
// import 'package:provider/provider.dart';
// import 'package:prototype_v5/services/authentication/auth.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // TODO: Handle error for Firebase.initializeApp

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final theme = AppTheme().light();
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AuthService>(
//           lazy: false,
//           create: (_) => AuthService(),
//         ),
//         ChangeNotifierProvider<UserId>(lazy: false, create: (_) => UserId()),
//       ],
//       child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: theme,
//           home: Consumer<AuthService>(builder: (context, auth, child) {
//             if (auth.isLoggedIn()) {
//               return const LearnerHome();
//             } else {
//               return const MainScreen();
//             }
//           }),
//           routes: {LearnerHome.routeName: (ctx) => const LearnerHome()}),
//     );
//   }
// }
