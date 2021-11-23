import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peca/components/continue_button.dart';
import 'package:peca/components/form_error.dart';
import 'package:peca/constants.dart';
import 'package:peca/data_services/auth/create_account.dart';
import 'package:peca/screen/verification/verification_screen.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;
  bool autherror = false;
  List<String> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormFiled(),
          SizedBox(height: getProportionateScreenHeight(15)),
          passwordFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          confirmPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(7)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          ContinueButton(
              text: "Sign Up",
              press: () {
                removeError(error: kSignUpError);
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  createAccount(email, confirmPassword).then((user) => {
                        if (user != null)
                          {
                            FirebaseFirestore.instance
                                .collection('UserData')
                                .doc(user.uid)
                                .set({
                              "email": user.email.toString(),
                              "name": user.displayName ?? "Name"
                            }),
                            Navigator.popAndPushNamed(
                                context, VerifyScreen.routeName),
                          }
                        else
                          {
                            errors = [],
                            addError(error: kSignUpError),
                          }
                      });
                }
              })
        ],
      ),
    );
  }

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      style: const TextStyle(color: kTextColor, fontSize: 15),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      style: const TextStyle(color: kTextColor, fontSize: 18),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField emailFormFiled() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      style: const TextStyle(color: kTextColor, fontSize: 18),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else {
          if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
            return "";
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter your email id",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.mail,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
