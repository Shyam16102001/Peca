import 'package:firebase_auth/firebase_auth.dart';
import 'package:peca/components/navigation_drawer.dart';
import 'package:peca/constants.dart';
import 'package:flutter/material.dart';
import 'package:peca/screen/home_page/components/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        drawerScrimColor: kPrimaryColor,
        appBar: AppBar(
            toolbarHeight: 80,
            title: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hello,",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                Text(FirebaseAuth.instance.currentUser!.displayName ?? "Name",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 22,
                    ))
              ],
            )),
        body: const Body());
  }
}
