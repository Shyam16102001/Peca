import 'package:peca/components/checking.dart';
import 'package:peca/routes.dart';
import 'package:peca/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peca',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: SignInScreen(),
      initialRoute: Checking.routeName,
      routes: routes,
    );
  }
}
