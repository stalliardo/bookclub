import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  // CurrentUser() {
  //   print("CurrentUser constructor called!");
  //   init();
  // }

  // Future<void> init() async {
  //   await Firebase.initializeApp();
  //   _auth.userChanges().listen((user) {
  //     if (user != null) {
  //       print("Logged in");
  //       // TODO -> Use user object
  //     } else {
  //       print("Not logged in");
  //     }
  //   });
  // }

  String? _uid;
  String? _email;

  // Is this neccessary? Arn't getters generated automatically or is that only when a constuctor is created?
  String? get getUid => _uid;
  String? get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  // constructor used to intialize firebase app

  Future<bool> registerUser(String email, String password) async {
    bool registrationSuccess = false;

    try {
      var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        registrationSuccess = true;
        print("Registration Successfull!");
      }
    } catch (e) {
      print("An error occured while registering the user. Error: $e");
    }

    return registrationSuccess;
  }

  Future<bool> logInUser(String email, String password) async {
    bool logInSuccess = false;

    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        logInSuccess = true;
        print("Log in successfull!");
        _uid = credential.user!.uid;
        _email = credential.user!.email;
      }
    } catch (e) {
      print("Error logging the user in. Error: $e");
    }

    return logInSuccess;
  }
}
