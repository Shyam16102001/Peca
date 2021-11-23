import 'package:flutter_svg/svg.dart';
import 'package:peca/constants.dart';
import 'package:flutter/material.dart';
import 'package:peca/size_config.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String routeName = "/notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text("Notification"),
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/notification.png",
                  height: 250,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  "No New Notification",
                  style: headingStyle.merge(
                      const TextStyle(color: kSecondaryColor, fontSize: 25)),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
