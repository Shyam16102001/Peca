import 'package:peca/components/continue_button.dart';
import 'package:peca/constants.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordConformation extends StatelessWidget {
  static String routeName = "/forgot_password_conformation";

  const ForgotPasswordConformation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Center(
                  child: Image.asset(
                    "assets/images/reset.png",
                    semanticLabel: "Reset Mail Sent",
                    height: 300,
                    width: 300,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Reset link sent",
                  style: headingStyle,
                ),
                const Text(
                  "\nPlease follow the instruction sent to your Email\nto reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSecondaryColor),
                ),
                const Spacer(),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: ContinueButton(
                      text: "Back to Sign In",
                      press: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, SignInScreen.routeName, (route) => false);
                      }),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
