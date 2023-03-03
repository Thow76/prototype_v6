import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:prototype_v5/models/learners/learner.dart';
import 'package:prototype_v5/services/authentication/auth.dart';
import 'package:provider/provider.dart';

class DatabaseService with ChangeNotifier {
  final String? uid;
  final _user = AuthService();
  DatabaseService({required this.uid});

//Helper

// Initialise learner data collection
  final CollectionReference learnerCollection =
      FirebaseFirestore.instance.collection('learners');

// Create initial Firebase collection entry
  Future signUpUserData({
    String role = 'user',
    String status = 'Signed Up',
    String? firstName = 'Please Register',
    String? surname = '',
    String? streetNumber = 'Please Register',
    String? flat = '',
    String? streetName = '',
    String? postcode = 'Please Register',
    String? email = 'Please Register',
    String? phoneNumber = 'Please Register',
    String? nationality = 'Please Register',
    String? nativeLanguage = 'Please Register',
    DateTime? dateOfBirth,
  }) async {
    return await learnerCollection.doc(uid).set({
      'first name': firstName,
      'surname': surname,
      'street number': streetNumber,
      'flat': flat,
      'street name': streetName,
      'postcode': postcode,
      'email': _user.email(),
      'phone number': phoneNumber,
      'nationality': nationality,
      'native language': nativeLanguage,
      'date of birth': dateOfBirth,
      'role': role,
      'learner status': status,
    });
  }

// Register user information and update exisiting Firebase collection
// Change user status from 'signed-up' to 'registered'
  Future registerUserData(
      String firstName,
      String surname,
      String streetNumber,
      String? flat,
      String streetName,
      String postcode,
      String phoneNumber,
      String nationality,
      String nativeLanguage,
      DateTime dateOfBirth,
      {String status = 'registered'}) async {
    return await learnerCollection.doc(uid).update({
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
      'status': status
    });
  }

  // List<LearnerView> _learnerDetailsFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     //print(doc.data);
  //     return LearnerView(
  //       firstName: doc['first name'] ?? '',
  //       surname: doc['surname'] ?? '',
  //       streetNumber: doc['street number'] ?? '',
  //       flat: doc['flat'] ?? '',
  //       streetName: doc['street name'] ?? '',
  //       postcode: doc['postcode'] ?? '',
  //       phoneNumber: doc['phone number'] ?? '',
  //       nationality: doc['nationality'] ?? '',
  //       nativeLanguage: doc['native language'] ?? '',
  //       dateOfBirth: doc['date of birth'] ?? '',
  //     );
  //   }).toList();
  // }

  // Stream<List<LearnerView>> get learnerData {
  //   return learnerCollection.snapshots().map(_learnerDetailsFromSnapshot);
  // }
}
