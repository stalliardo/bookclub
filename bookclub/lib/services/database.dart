import 'package:bookclub/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum StatusCode { ERROR, SUCCESS }

class MyDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(MyUser user) async {
    String returnValue = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        "fullName": user.fullName,
        "email": user.email,
        "accountCreated": Timestamp.now(),
      });

      returnValue = "Success";
    } catch (e) {
      print(e);
    }

    return returnValue;
  }

  Future<MyUser> getUserInfo(String uid) async {
    MyUser user = MyUser();

    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();

      Map<String, dynamic> data = _doc.data() as Map<String, dynamic>;

      user.uid = uid;
      user.fullName = data["fullName"];
      user.email = data["email"];
      user.accountCreated = data["accountCreated"];
      user.groupId = data["groupId"];
    } catch (e) {
      print(e);
    }

    return user;
  }

  /////////////////////////////////////////////// Group operations ///////////////////////////////////////////////

  Future<StatusCode> createGroup(String groupName, String userUid) async {
    // DocumentReference is used here to get the groupId so we can use it
    List<String>? members = [];
    try {
      members.add(userUid);

      DocumentReference docRef = await _firestore.collection("groups").add({
        "name": groupName,
        "leader": userUid,
        "members": members,
        "groupCreated": Timestamp.now(),
      });

      await _firestore.collection("users").doc(userUid).update({
        "groupId": docRef.id,
      });
      return StatusCode.SUCCESS;
    } catch (e) {
      return StatusCode.ERROR;
    }
  }

  Future<StatusCode> joinGroup(String groupId, String userUid) async {
    List<String> members = [userUid];

    try {
      await _firestore.collection("groups").doc(groupId).update({
        "members": FieldValue.arrayUnion(members),
      });
      await _firestore.collection("users").doc(userUid).update({
        "groupId": groupId,
      });
      return StatusCode.SUCCESS;
    } catch (e) {
      return StatusCode.ERROR;
    }
  }
}
