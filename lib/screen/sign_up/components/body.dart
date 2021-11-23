import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/components/already_user_text.dart';
import 'package:peca/constants.dart';
import 'package:peca/screen/sign_up/components/signup_form.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/logo.png", height: 40, width: 40),
                    const SizedBox(width: 10),
                    Text(
                      appName,
                      style: headingStyle,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SvgPicture.asset(
                  "assets/images/signup.svg",
                  height: 150,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                const SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                const AlreadyUser(),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
