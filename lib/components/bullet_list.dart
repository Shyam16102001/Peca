import 'package:flutter/material.dart';
import 'package:peca/constants.dart';
import 'package:peca/size_config.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;

  BulletList(this.strings);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(50)),
              Text(
                '\u2022',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(30),
                  height: getProportionateScreenHeight(1),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(30),
                      color: kSecondaryColor,
                      height: getProportionateScreenHeight(1)),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
