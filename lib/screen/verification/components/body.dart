import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/components/continue_button.dart';
import 'package:peca/constants.dart';
import 'package:peca/data_services/auth/log_out.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
  @override
  void initState() {
    user = _auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    logOut();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Center(
                  child: SvgPicture.asset(
                "assets/images/verify.svg",
                height: 250,
                width: 250,
              )),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Almost there",
                style: headingStyle,
              ),
              Text(
                "\nWe need to verify your account.\nPlease click the link sent to ${user.email}.",
                textAlign: TextAlign.center,
                style: const TextStyle(color: kSecondaryColor),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: ContinueButton(
                    text: "Back to Sign In",
                    press: () {
                      Navigator.popAndPushNamed(
                          context, SignInScreen.routeName);
                    }),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = _auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      logOut();
      Navigator.popAndPushNamed(context, SignInScreen.routeName);
    }
  }
}
