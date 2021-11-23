import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/components/continue_button.dart';
import 'package:peca/components/form_error.dart';
import 'package:peca/components/new_user_text.dart';
import 'package:peca/constants.dart';
import 'package:peca/data_services/auth/reset_password.dart';
import 'package:peca/screen/forgot_password/forgot_password_conformation._screen.dart';
import 'package:peca/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  List<String> errors = [];
  bool sentMail = false;
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
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/logo.png", height: 40, width: 40),
                    const SizedBox(width: 10),
                    Text(
                      appName,
                      style: headingStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              SvgPicture.asset(
                "assets/images/forgot.svg",
                height: 150,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    emailFormField(),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    FormError(errors: errors),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    ContinueButton(
                        text: "Reset it",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            resetPassword(email).then((value) => {
                                  if (value)
                                    {
                                      Navigator.popAndPushNamed(context,
                                          ForgotPasswordConformation.routeName)
                                    }
                                  else
                                    {
                                      errors = [],
                                      addError(error: kEmailNotSent),
                                    }
                                });
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const NewUserText(),
            ]),
          ),
        ),
      ),
    );
  }

  TextFormField emailFormField() {
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
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
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
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.mail,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
