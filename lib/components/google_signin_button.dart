import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/constants.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final String? text;
  final VoidCallback press;
  const GoogleSignInButton({
    Key? key,
    this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side: const BorderSide(color: kPrimaryColor),
            ),
            primary: kBackgroundColor,
            elevation: 10),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/google.svg",
              height: 30,
              width: 30,
            ),
            Text(
              text!,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: getProportionateScreenWidth(24),
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
