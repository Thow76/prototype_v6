import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prototype_v5/models/learners/learner.dart';

// Initialise Firebase collection

// Implements the changenotifier class accross the app
class Learners with ChangeNotifier {
  List<Learner> _details = [];

  // var _selectedOnly = false;

  // void showSelectedOnly() {
  //   _selectedOnly = true;
  //   notifyListeners();
  // }

  // void showSelectedAll() {
  //   _selectedOnly = false;
  //   notifyListeners();
  // }

  List<Learner> get details {
    // if (_selectedOnly) {
    //   return _details.where((learners) => learners.isSelected).toList();
    // }
    return [..._details];
  }

  // List<LearnerView> get selectedLearner {
  //   // if (_selectedOnly) {
  //   //   return _details.where((learners) => learners.isSelected).toList();
  //   // }
  //   return _details.where((selLearn) => selLearn.isSelected).toList();
  // }

  // LearnerView findByName(String name) {
  //   return _details.firstWhere((learner) => learner.firstName == name);
  // }
}
