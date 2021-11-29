import 'package:bookclub/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  MyUser? _currentUser;
  String? _uid;
  String? _email;
  bool _isLoggedIn = false;
  String? get getUid => _uid;
  String? get getEmail => _email;
  bool get isLoggedIn => _isLoggedIn;

  FirebaseAuth? _auth;

  CurrentUser() {
    init();
  }

  Future<void> init() async {
    _auth = FirebaseAuth.instance;
    _auth!.userChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _email = user.email;
        _isLoggedIn = true;
      } else {
        _uid = null;
        _email = null;
        _isLoggedIn = false;
      }

      notifyListeners();
    });
  }

  Future<String> registerUser(String email, String password) async {
    String returnValue = "error";

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      returnValue = "Success";
    } catch (e) {
      returnValue = "error";
    }
    notifyListeners();

    return returnValue;
  }

  Future<String> logInUserWithEmailAndPassword(String email, String password) async {
    String returnValue = "error";

    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      returnValue = "Success";
      print("Log in successfull! is logged in = = = $_isLoggedIn");
      _uid = credential.user!.uid;
      _email = credential.user!.email;
    } catch (e) {
      print("Error logging the user in. Error: $e");
      returnValue = "error";
    }
    notifyListeners();

    return returnValue;
  }

  Future<String> signUserOut() async {
    String returnValue = "error";
    try {
      await FirebaseAuth.instance.signOut();
      _uid = null;
      _email = null;
      _isLoggedIn = false;
      returnValue = "Success";
    } catch (e) {
      returnValue = "error";
    }

    return returnValue;
  }
}
