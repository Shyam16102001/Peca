import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  late String name;
  late String email;

  getUserData() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    late User user = _auth.currentUser!;
    await FirebaseFirestore.instance
        .collection('UserData')
        .doc(user.uid)
        .get()
        .then((value) {
      name = value.data()!['name'];
      email = value.data()!['email'];
    });
  }
}
