import 'package:peca/constants.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class AlreadyUser extends StatelessWidget {
  const AlreadyUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: kSecondaryColor),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, SignInScreen.routeName, (route) => false),
          // onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
          //     SignInScreen.routeName,
          //     ModalRoute.withName(SignUpScreen.routeName)),
          child: Text(
            "Sign In ",
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
