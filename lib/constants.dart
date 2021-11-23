import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFF1D1C24);
const kPrimaryLightColor = Color(0xFF7832FF);
const kSecondaryColor = Color(0xFF898A96);
const kTextColor = Color(0xFF1D1C24);
const kBackgroundColor = Color(0xFFF8F8F8);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(38),
  fontWeight: FontWeight.bold,
  fontFamily: "Lato",
);

const String appName = "Peca";
const String quote = "A Digital Pet Care System";
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter Valid Email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kSignUpError = "Account Already Exists.Please Sign In";
const String kSignInError = "Invalid Email or Password";
const String kEmailSent = "Email has been sent";
const String kEmailNotSent = "Something went wrong.Please try again";
