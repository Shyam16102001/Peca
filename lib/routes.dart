import 'package:peca/components/checking.dart';
import 'package:peca/screen/about/about_screen.dart';
import 'package:peca/screen/account/account_screen.dart';
import 'package:peca/screen/home_page/home_page.dart';
import 'package:peca/screen/forgot_password/forgot_password_conformation._screen.dart';
import 'package:peca/screen/forgot_password/forgot_password_screen.dart';
import 'package:peca/screen/notification/notification_screen.dart';
import 'package:peca/screen/pets/add_pets_screen.dart';
import 'package:peca/screen/pets/pets_detail_screen.dart';
import 'package:peca/screen/pets/pets_screen.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/screen/sign_up/sign_up_screen.dart';
import 'package:peca/screen/tips/tips_screen.dart';
import 'package:peca/screen/verification/verification_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  Checking.routeName: (context) => const Checking(),
  // SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  ForgotPasswordConformation.routeName: (context) =>
      const ForgotPasswordConformation(),
  VerifyScreen.routeName: (context) => const VerifyScreen(),
  PetsScreen.routeName: (context) => const PetsScreen(),
  TipsScreen.routeName: (context) => const TipsScreen(),
  AccountScreen.routeName: (context) => const AccountScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  AboutScreen.routeName: (context) => const AboutScreen(),
  AddPet.routeName: (context) => const AddPet(),
  // PetsDetailScreen.routeName: (context) =>  PetsDetailScreen(),
  // NoInternetScreen.routeName: (context) => NoInternetScreen(),
};
