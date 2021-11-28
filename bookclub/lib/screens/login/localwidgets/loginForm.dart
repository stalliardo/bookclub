import 'package:bookclub/screens/signup/signup.dart';
import 'package:bookclub/utils/ourtheme.dart';
import 'package:bookclub/widgets/myContainer.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            "Log In",
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.alternate_email_rounded), hintText: "Email"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            print("Sign user up pressed!");
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 76),
            child: Text("Log in"),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            child: Text("Don't have an account? Sign up here"))
      ],
    ));
  }
}
