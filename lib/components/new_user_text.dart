import 'package:peca/constants.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/screen/sign_up/sign_up_screen.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class NewUserText extends StatelessWidget {
  const NewUserText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: kSecondaryColor),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              SignUpScreen.routeName,
              ModalRoute.withName(SignInScreen.routeName)),
          child: Text(
            "Sign Up ",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
