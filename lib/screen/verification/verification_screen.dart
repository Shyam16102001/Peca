import 'package:flutter/material.dart';
import 'components/body.dart';

class VerifyScreen extends StatelessWidget {
  static String routeName = "/verify_success";

  const VerifyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
    );
  }
}
