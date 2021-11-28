import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/utils/ourtheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // removes the debug overlay from the previewer
      debugShowCheckedModeBanner: false,
      theme: OurTheme().buildTheme(),
      home: Login(),
    );
    // home: ,
  }
}
