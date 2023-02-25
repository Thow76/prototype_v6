import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserId with ChangeNotifier {
  final auth = FirebaseAuth.instanceFor;

  UserId();
}

class LearnerView with ChangeNotifier {
  final String learnerId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String nationality;
  final String nativeLanguage;
  final String englishLevel;

  LearnerView({
    required this.learnerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.nationality,
    required this.nativeLanguage,
    required this.englishLevel,
  });

  // void toggleSelectedStatus() {
  //   isSelected = !isSelected;
  //   notifyListeners();
  // }
}
