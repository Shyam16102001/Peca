import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';

Future<User?> googleSignIn(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final googlesignIn = GoogleSignIn();
  try {
    GoogleSignInAccount? googleSignInAccount = await googlesignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    User? user = (await _auth.signInWithCredential(credential)).user;
    if (user != null) {
      return user;
    } else {
      return user;
    }
  } catch (e) {
    Navigator.popAndPushNamed(context, SignInScreen.routeName);
  }
}
