import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/components/google_signin_button.dart';
import 'package:peca/components/new_user_text.dart';
import 'package:peca/constants.dart';
import 'package:peca/data_services/auth/google_sign_in.dart';
import 'package:peca/screen/home_page/home_page.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';
import 'signin_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset("assets/icons/logo.png",
                          height: 40, width: 40),
                      Text(
                        appName,
                        style: headingStyle,
                      ),
                      const Text(
                        quote,
                        style: TextStyle(color: kSecondaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SvgPicture.asset(
                  "assets/images/signin.svg",
                  height: 150,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.015),
                Text(
                  "or continue with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontStyle: FontStyle.italic,
                      color: kSecondaryColor),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.015),
                GoogleSignInButton(
                  text: " Google",
                  press: () {
                    googleSignIn(context).then((user) => {
                          if (user != null)
                            {
                              FirebaseFirestore.instance
                                  .collection('UserData')
                                  .doc(user.uid)
                                  .set({
                                "email": user.email.toString(),
                                "name": user.displayName ?? "Name"
                              }),
                              // UserData(),
                              Navigator.popAndPushNamed(
                                  context, HomePage.routeName),
                            }
                          else
                            {
                              Navigator.popAndPushNamed(
                                  context, SignInScreen.routeName),
                            }
                        });
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NewUserText(),
                SizedBox(height: SizeConfig.screenHeight * 0.015),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
