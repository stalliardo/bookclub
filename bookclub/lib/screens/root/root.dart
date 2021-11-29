import 'package:bookclub/screens/home/home.dart';
import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRoot extends StatefulWidget {
  MyRoot({Key? key}) : super(key: key);

  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CurrentUser>(
          builder: (context, _user, _) => ScreenLoader(isLoggedIn: _user.isLoggedIn),
        ),
      ),
    );
  }
}

// class to determine which Widget to render...
class ScreenLoader extends StatelessWidget {
  bool isLoggedIn;

  ScreenLoader({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomeScreen() : Login();
  }
}
