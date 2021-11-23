import 'package:peca/components/bullet_list.dart';
import 'package:flutter/material.dart';
import 'package:peca/size_config.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);
  static String routeName = "/tips";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pet Care Tips"),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              BulletList(const [
                'Regular Exams are Vital.\n',
                'Spay and Neuter Your Pets.\n',
                'Prevent Parasites.\n',
                'Maintain a Healthy Weight.\n',
                'Get Regular Vaccinations.\n',
                'Provide an Enriched Environment.\n',
                'Microchip and Tattoo Your Pet.\n',
                'Pets Need Dental Care, Too.\n',
                'Never Give Pets People Medication\n',
                'Proper Restraint in a Vehicle'
              ]),
            ],
          ),
        ));
  }
}
