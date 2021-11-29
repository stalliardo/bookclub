import 'package:bookclub/screens/home/home.dart';
import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus { loggedIn, notLoggedIn }

class MyRoot extends StatefulWidget {
  MyRoot({Key? key}) : super(key: key);

  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CurrentUser>(
          builder: (context, someVar, _) => ScreenLoader(isLoaded: someVar.isLoggedIn),
        ),
      ),
    );
  }
}

// class to determine which Widget to render...
class ScreenLoader extends StatelessWidget {
  bool isLoaded;

  ScreenLoader({required this.isLoaded});

  @override
  Widget build(BuildContext context) {
    return isLoaded ? HomeScreen() : Login();
  }
}
