import 'package:peca/constants.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  IconData? icon;
  ContinueButton({
    Key? key,
    required this.text,
    required this.press,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: const Color(0xFF7832FF),
            elevation: 10),
        onPressed: press,
        child: icon == null
            ? Text(text,
                style: TextStyle(
                    fontFamily: "Robato",
                    fontSize: getProportionateScreenWidth(24),
                    color: kBackgroundColor))
            : Row(children: [
                Icon(icon),
                Text(text,
                    style: TextStyle(
                      fontFamily: "Robato",
                      fontSize: getProportionateScreenWidth(24),
                      color: kBackgroundColor,
                    ))
              ]),
      ),
    );
  }
}
