import 'package:flutter/material.dart';
import 'package:peca/components/build_info.dart';
import 'package:peca/constants.dart';
import 'package:peca/size_config.dart';

class PetsDetailScreen extends StatelessWidget {
  PetsDetailScreen(
      {Key? key,
      required this.name,
      required this.age,
      required this.urlImage,
      required this.gender,
      required this.type})
      : super(key: key);
  static String routeName = "/pets_details";
  String name;
  String age;
  String urlImage;
  String gender;
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Center(
              child: CircleAvatar(
                radius: 125,
                backgroundImage: NetworkImage(urlImage),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildInfo("Name :", name),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            buildInfo("Age :", age),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            buildInfo("Gender :", gender),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            buildInfo("Pet Type :", type),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            // SizedBox(
            //     width: 165,
            //     child: ContinueButton(
            //         icon: Icons.add_circle_outlined,
            //         text: " Add Pet",
            //         press: () => Navigator.of(context)
            //             .popAndPushNamed(HomePage.routeName))),
          ],
        ),
      ),
    );
  }
}
