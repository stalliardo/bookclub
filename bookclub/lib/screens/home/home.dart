import 'package:bookclub/screens/root/root.dart';
import 'package:bookclub/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is the home page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Sign out"),
          onPressed: () async {
            // TODO sign user out
            String resultString = await Provider.of<CurrentUser>(context, listen: false).signUserOut();
            // Not actually needed as the consumer in the root class watches the value of the currentUser.isLogged in property
            // THis is only used here to remove all the screens on the stack
            if (resultString == "Success") {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyRoot()), (route) => false);
            }
          },
        ),
      ),
    );
  }
}
