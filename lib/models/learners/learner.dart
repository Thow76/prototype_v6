import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:prototype_v5/services/authentication/auth.dart';

class UserId with ChangeNotifier {
  final auth = FirebaseAuth.instanceFor;
}

class Learner with ChangeNotifier {
  final String? uid;
  final String? firstName;
  final String? surname;
  final String? streetNumber;
  final String? flat;
  final String? streetName;
  final String? postcode;
  final String? email = FirebaseAuth.instance.currentUser!.email;
  final String? phoneNumber;
  final String? nationality;
  final String? nativeLanguage;
  final DateTime? dateOfBirth;

  Learner({
    required this.uid,
    required this.firstName,
    required this.surname,
    required this.streetNumber,
    required this.flat,
    required this.streetName,
    required this.postcode,
    required this.phoneNumber,
    required this.nationality,
    required this.nativeLanguage,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() => {
        'id': uid,
        'first name': firstName,
        'surname': surname,
        'street number': streetNumber,
        'flat': flat,
        'street name': streetName,
        'postcode': postcode,
        'phone number': phoneNumber,
        'nationality': nationality,
        'native language': nativeLanguage,
        'date of birth': dateOfBirth,
      };

  // void toggleSelectedStatus() {
  //   isSelected = !isSelected;
  //   notifyListeners();
  // }

  static Learner fromJson(Map<String, dynamic> json) => Learner(
        uid: '',
        firstName: json['first name'],
        surname: json['surname'],
        streetNumber: json['street number'],
        flat: json['flat'],
        streetName: json['street name'],
        postcode: json['postcode'],
        phoneNumber: json['phone number'],
        nationality: json['nationality'],
        nativeLanguage: json['native language'],
        dateOfBirth: (json['date of birth'] as Timestamp).toDate(),
      );
}
