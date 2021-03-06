import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:peca/constants.dart';
import 'package:peca/screen/home_page/home_page.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checking extends StatefulWidget {
  const Checking({Key? key}) : super(key: key);
  static String routeName = "/checking";

  @override
  _CheckingState createState() => _CheckingState();
}

class _CheckingState extends State<Checking> {
  late Timer timer;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    Future.delayed(const Duration(seconds: 0), () {
      checkLogin();
    });
    super.initState();
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: kPrimaryLightColor,
          size: 75.0,
        ),
      ),
    );
  }

  Future<void> checkLogin() async {
    user = _auth.currentUser;
    // timer.cancel();
    if (_auth.currentUser != null) {
      // UserData();
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
    }
  }
}
