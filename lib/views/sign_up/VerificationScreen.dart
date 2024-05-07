import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import 'package:test2/views/login/login_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/TextfieldOTP/TextfieldOTP.dart';
import '../../data/controllers/controller.dart';
import 'inscription.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Image.asset(
                "assets/images/Permit_3__4-removebg-preview.png",
                height: 147,
                width: 171,
              ),
              const SizedBox(height: 32),
              Text(
                "Code de vérification",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'poppins',
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Nous avons envoyé le code de vérification à votre adresse e-mail",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 96),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => OTPInput(
                        controller: textEditingCtrls[index],
                        first: index == 0,
                        last: index == 3,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 5,
                        color: Colors.white60),
                  )),
              const SizedBox(height: 105),
              Column(
                children: [
                  MyButton(
                    txt: "Continue",
                    onPressed: () {
                      if (validateFields()) {
                        Get.to(Inscription());
                      } else {
                        print("Veuillez remplir tous les champs !");
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vous avez déjà un compte ?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO : USE get.toNamed IN ALL THE APP
                          Get.toNamed(RouteHelper.signIn);
                        },
                        child: Text(
                          "Se Connecter",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    if (c1.text.isEmpty ||
        c2.text.isEmpty ||
        c3.text.isEmpty ||
        c4.text.isEmpty) {
      return false;
    }
    return true;
  }
}
