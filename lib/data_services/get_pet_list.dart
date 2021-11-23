import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseManager {
  Future getPetsList() async {
    List itemsList = [];
    try {
      await FirebaseFirestore.instance
          .collection("UserData")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Pets")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      return null;
    }
  }
}
