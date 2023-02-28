// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:prototype_v5/models/learners/learner.dart';


// class DatabaseService {
//   final String uid;

//   DatabaseService({required this.uid});

//   final CollectionReference userCollection =
//       FirebaseFirestore.instance.collection('learners');

//   Future signUpUserData(
//      String email,
//       {String role = 'user'}) async {
//     return await userCollection.doc(uid).set({
//       'email': email,
//       'role': role,
//     });
//   }
// }

