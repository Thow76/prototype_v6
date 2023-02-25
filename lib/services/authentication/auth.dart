import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Helper methods

// 1
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

// 2
  String? userId() {
    return _auth.currentUser?.uid;
  }

// 3
  String? email() {
    return _auth.currentUser?.email;
  }

// Sign up method
  void signup(String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The provided password is not strong enough');
      } else if (e.code == 'email-already-in-use') {
        print('An account already exists for that email');
      } else if (e.code == 'invalid-email') {
        print('The email is invalid');
      }
    } catch (e) {
      print(e);
    }
  }

// Login method
  void login(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Navigator.of(context).pushNamed(LearnerHome.routeName);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('Email is not valid');
      } else if (e.code == 'user-not-found') {
        print('User does not exist');
      } else if (e.code == 'wrong-password') {
        print('Password does not match account');
      }
    } catch (e) {
      print(e);
    }
  }

// Sign out method
  void logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
