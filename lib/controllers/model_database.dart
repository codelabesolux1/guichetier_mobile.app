import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  String? telephone1 = FirebaseAuth.instance.currentUser!.phoneNumber;

  Future getCurrentUserData() async {
    try {
      DocumentSnapshot data = await users.doc(uid).get();
      String username = "${data['username']}";
      String telephone =
          (data['telephone'] == null ? telephone1! : "${data['telephone']}");
      String profession = "${data['profession']}";
      String imageUrl = "${data['imageUrl']}";
      return [
        username,
        telephone,
        profession,
        imageUrl,
      ];
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
