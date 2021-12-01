import 'package:bookclub/screens/group/nogroup/noGroup.dart';
import 'package:bookclub/screens/root/root.dart';
import 'package:bookclub/states/currentUser.dart';
import 'package:bookclub/widgets/myContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _signOut(BuildContext context) async {
    // TODO sign user out
    String resultString = await Provider.of<CurrentUser>(context, listen: false).signUserOut();
    // Not actually needed as the consumer in the root class watches the value of the currentUser.isLogged in property
    // THis is only used here to remove all the screens on the stack
    if (resultString == "Success") {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyRoot()), (route) => false);
    }
  }

  void _goToNoGroup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyNoGroup(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: MyContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harry Potter and the sorceror's stone",
                    style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          "Due in:",
                          style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                        ),
                        Text(
                          " 8 Days",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Finished Book",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: MyContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Next book revealed in:",
                    style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                  ),
                  Text(
                    "22 Hours",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: ElevatedButton(
              child: Text(
                "Book Club History",
              ),
              onPressed: () async {
                _goToNoGroup(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: ElevatedButton(
              child: Text("Sign out"),
              onPressed: () async {
                _signOut(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
