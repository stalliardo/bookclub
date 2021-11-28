import 'package:bookclub/widgets/myContainer.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            "Sign Up",
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline), hintText: "Full Name"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.alternate_email_rounded), hintText: "Email"),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            hintText: "Password",
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.lock_open), hintText: "Confirm Password"),
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
            child: Text("Sign Up"),
          ),
        ),
      ],
    ));
  }
}
