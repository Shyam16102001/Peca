import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peca/components/continue_button.dart';
import 'package:peca/constants.dart';
import 'package:peca/screen/home_page/home_page.dart';
import 'package:peca/size_config.dart';

class AddPet extends StatefulWidget {
  static String routeName = "/add_pets";

  const AddPet({Key? key}) : super(key: key);

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  String gender = "Male";
  late String age;
  late String type;
  // late String password;
  List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Pet")),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  const CircleAvatar(
                    radius: 100,
                    // backgroundImage: AssetImage("assets/icons/logo.png"),
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1609791636587-50feca5caee7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  // textField("Pet's Name", Icons.pets),
                  nameFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  genderFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  // textField("Age", Icons.date_range),
                  ageFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  typreFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  SizedBox(
                      width: 165,
                      child: ContinueButton(
                          icon: Icons.add_circle_outlined,
                          text: " Add Pet",
                          press: () {
                            FirebaseFirestore.instance
                                .collection('UserData')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("Pets")
                                .doc()
                                .set({
                              "url":
                                  "https://images.unsplash.com/photo-1609791636587-50feca5caee7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80",
                              "Name": name,
                              "Gender": gender,
                              "Age": age,
                              "Pet Type": type
                            });
                            Navigator.of(context)
                                .popAndPushNamed(HomePage.routeName);
                          })),
                ],
              ),
            )),
      ),
    );
  }

  Container genderFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: kSecondaryColor)),
      child: Row(
        children: [
          SizedBox(width: getProportionateScreenWidth(10)),
          const Icon(Icons.transgender_rounded),
          const Text("  Gender",
              style: TextStyle(color: kSecondaryColor, fontSize: 18)),
          SizedBox(width: getProportionateScreenWidth(125)),
          DropdownButton<String>(
            value: gender,
            style: const TextStyle(color: kTextColor, fontSize: 18),
            underline: Container(),
            onChanged: (String? newValue) {
              setState(() {
                gender = newValue!;
              });
            },
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  TextFormField nameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => setState(() {
        name = newValue!;
      }),
      onChanged: (value) => setState(() {
        name = value;
      }),
      style: const TextStyle(color: kTextColor, fontSize: 18),
      decoration: const InputDecoration(
        hintText: "Pet's Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.pets,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField ageFormField() {
    bool error = false;
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => setState(() {
        age = newValue!;
      }),
      onChanged: (value) => setState(() {
        age = value;
      }),
      validator: (email) {
        if (email!.isEmpty) {
          setState(() {
            error = true;
          });
        } else {
          setState(() {
            error = false;
          });
        }
      },
      style: const TextStyle(color: kTextColor, fontSize: 18),
      decoration: const InputDecoration(
        hintText: "Age",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.date_range,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField typreFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => setState(() {
        type = newValue!;
      }),
      onChanged: (value) => setState(() {
        type = value;
      }),
      style: const TextStyle(color: kTextColor, fontSize: 18),
      decoration: const InputDecoration(
        hintText: "Pet Type",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
