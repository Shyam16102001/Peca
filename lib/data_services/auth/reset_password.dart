import 'package:firebase_auth/firebase_auth.dart';

Future<bool> resetPassword(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.sendPasswordResetEmail(email: email);
    return true;
  } catch (e) {
    return false;
  }
}
