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

  Future<String> registerUser(String email, String password) async {
    String returnValue = "error";

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      returnValue = "Success";
    } catch (e) {
      returnValue = "error";
    }

    return returnValue;
  }

  Future<String> logInUserWithEmailAndPassword(String email, String password) async {
    String returnValue = "error";

    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      returnValue = "Success";
      print("Log in successfull!");
      _uid = credential.user!.uid;
      _email = credential.user!.email;
    } catch (e) {
      print("Error logging the user in. Error: $e");
      returnValue = "error";
    }

    return returnValue;
  }
}
