import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/components/continue_button.dart';
import 'package:peca/constants.dart';
import 'package:flutter/material.dart';
import 'package:peca/data_services/auth/log_out.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/size_config.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User user = _auth.currentUser!;
    late String name;
    late String email;
    name = shortner(user.displayName == null ? "Name" : user.displayName!);
    email = shortner(user.email == null ? "Email ID" : user.email!);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(24)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Center(
              child: user.photoURL == null
                  ? SvgPicture.asset(
                      "assets/images/profile.svg",
                      height: 200,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                        user.photoURL!,
                      ),
                      radius: 100,
                    ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildInfo("Name :", name),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            buildInfo("Email ID :", email),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            buildInfo("Password :", "**********"),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            ContinueButton(
              text: "Log Out",
              press: () => logOut().then((value) => {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignInScreen.routeName,
                        (Route<dynamic> route) => false),
                  }),
            ),
          ],
        ),
      ),
    );
  }

  String shortner(String text) {
    if (text.length > 30) {
      text = text.substring(0, 25);
      return (text + ".....");
    } else {
      return text;
    }
  }

  Widget buildInfo(String title, String value) => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenWidth(24),
                  color: kPrimaryColor),
            ),
            SizedBox(width: SizeConfig.screenHeight * 0.05),
            Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenWidth(20),
                  color: kSecondaryColor),
            ),
          ],
        ),
      );
}
