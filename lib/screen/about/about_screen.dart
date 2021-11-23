import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/constants.dart';
import 'package:flutter/material.dart';
import 'package:peca/size_config.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static String routeName = "/about";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
          elevation: 1,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Column(
                  children: [
                    Image.asset("assets/icons/logo.png", height: 40, width: 40),
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
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SvgPicture.asset(
                  "assets/images/about.svg",
                  height: 300,
                  width: 300,
                ),
                const Text(
                  "Peco is a digital pet care system which has a main motive to enrich the lives of pets and their families by providing excellent pet care.",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                )
              ],
            ),
          ),
        ));
  }
}
