import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/constants.dart';
import 'package:flutter/material.dart';
import 'package:peca/data_services/get_pet_list.dart';
import 'package:peca/screen/pets/add_pets_screen.dart';
import 'package:peca/screen/pets/pets_detail_screen.dart';
import 'package:peca/size_config.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({Key? key}) : super(key: key);
  static String routeName = "/pets";

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  List userPetList = [];

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  fetchDatabaseList() async {
    dynamic result = await DataBaseManager().getPetsList();
    if (result == null) {
    } else {
      setState(() {
        userPetList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Pets"),
          elevation: 1,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AddPet.routeName),
                  child: const Icon(Icons.add_circle),
                )),
          ],
        ),
        body: userPetList.isEmpty
            ? Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SvgPicture.asset(
                  "assets/images/not_found.svg",
                  height: getProportionateScreenHeight(900),
                ),
              )
            : Scrollbar(
                child: ListView.builder(
                  itemCount: userPetList.length,
                  itemBuilder: (context, index) {
                    final urlImage = userPetList[index]['url'];
                    final name = userPetList[index]['Name'];
                    final age = userPetList[index]['Age'];

                    return buildList(context, urlImage, name, age, index);
                  },
                ),
              ));
  }

  Widget buildList(BuildContext context, String urlImage, String name,
      String age, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PetsDetailScreen(
                      name: name,
                      age: age,
                      urlImage: urlImage,
                      gender: userPetList[index]['Gender'],
                      type: userPetList[index]['Pet Type'],
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 3)]),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 150,
              child: Image.network(urlImage, fit: BoxFit.cover),
            ),
            // Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: NetworkImage(urlImage), fit: BoxFit.cover),
            //       borderRadius: BorderRadius.circular(12)),
            // ),
            SizedBox(width: getProportionateScreenWidth(30)),
            Column(
              children: [
                Text(name, style: headingStyle),
                Text("Age: $age"),
              ],
            ),
            // const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
