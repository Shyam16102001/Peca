import 'package:flutter_svg/svg.dart';
import 'package:peca/constants.dart';
import 'package:peca/data_services/auth/log_out.dart';
import 'package:peca/screen/about/about_screen.dart';
import 'package:peca/screen/account/account_screen.dart';
import 'package:peca/screen/notification/notification_screen.dart';
import 'package:peca/screen/pets/pets_screen.dart';
import 'package:peca/screen/sign_in/sign_in_screen.dart';
import 'package:peca/screen/tips/tips_screen.dart';
import 'package:peca/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  @override
  void initState() {
    user = _auth.currentUser!;
    super.initState();
  }

  String shortner(String text) {
    if (text.length > 25) {
      text = text.substring(0, 20);
      return (text + ".....");
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    late String name;
    late String email;
    name = shortner(user.displayName == null ? "Name" : user.displayName!);
    email = shortner(user.email == null ? "Email ID" : user.email!);
    return Drawer(
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: ListTileTheme(
            iconColor: kPrimaryColor,
            textColor: kPrimaryColor,
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25)),
              children: [
                buildHeader(
                    name: name,
                    email: email,
                    onClicked: () => selectedItem(context, 3)),
                SizedBox(height: getProportionateScreenHeight(15)),
                // buildMenuItem(
                //     text: "Home",
                //     icon: Icons.home,
                //     onClicked: () => selectedItem(context, 0)),
                // SizedBox(height: getProportionateScreenHeight(15)),
                buildMenuItem(
                    text: "My Pets",
                    icon: Icons.pets,
                    onClicked: () => selectedItem(context, 0)),
                SizedBox(height: getProportionateScreenHeight(15)),
                buildMenuItem(
                    text: "Tips",
                    icon: Icons.emoji_objects,
                    onClicked: () => selectedItem(context, 1)),
                SizedBox(height: getProportionateScreenHeight(15)),
                buildMenuItem(
                    text: "Notifications",
                    icon: Icons.notifications_active,
                    onClicked: () => selectedItem(context, 2)),
                SizedBox(height: getProportionateScreenHeight(15)),
                buildMenuItem(
                    text: "My Account",
                    icon: Icons.account_circle,
                    onClicked: () => selectedItem(context, 3)),
                SizedBox(height: getProportionateScreenHeight(25)),
                const Divider(color: kPrimaryColor),
                SizedBox(height: getProportionateScreenHeight(25)),
                buildMenuItem(
                    text: "About Us",
                    icon: Icons.info,
                    onClicked: () => selectedItem(context, 4)),
                SizedBox(height: getProportionateScreenHeight(15)),
                buildMenuItem(
                    text: "Log Out",
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        child: Row(children: [
          user.photoURL == null
              ? SvgPicture.asset(
                  "assets/images/profile.svg",
                  height: 50,
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.photoURL!,
                  ),
                  radius: 25,
                ),
          const Spacer(),
          // SizedBox(width: getProportionateScreenWidth(20)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              SizedBox(height: getProportionateScreenHeight(9)),
              Text(
                email,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
        ]),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(text, style: const TextStyle(fontSize: 22)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).popAndPushNamed(PetsScreen.routeName);
        break;
      case 1:
        Navigator.of(context).popAndPushNamed(TipsScreen.routeName);
        break;
      case 2:
        Navigator.of(context).popAndPushNamed(NotificationScreen.routeName);
        break;
      case 3:
        Navigator.of(context).popAndPushNamed(AccountScreen.routeName);
        break;
      case 4:
        Navigator.of(context).popAndPushNamed(AboutScreen.routeName);
        break;
      case 5:
        logOut().then((value) => {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SignInScreen.routeName, (Route<dynamic> route) => false),
            });
        break;
      default:
    }
  }
}
