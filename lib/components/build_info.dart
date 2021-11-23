import 'package:flutter/material.dart';
import 'package:peca/constants.dart';
import 'package:peca/size_config.dart';

Widget buildInfo(String title, String value) => Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                fontSize: getProportionateScreenWidth(28),
                color: kPrimaryColor),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.05),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins",
                fontSize: getProportionateScreenWidth(24),
                color: kBackgroundColor),
          ),
        ],
      ),
    );
