import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import '../../data/controllers/signup_controller.dart';
import '../../widgets/TextfieldOTP/TextfieldOTP.dart';

class VerificationScreen extends GetView<SignUpController> {
  VerificationScreen({Key? key});

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
                    controller: controller.textEditingCtrls[index],
                    first: index == 0,
                    last: index == 3,
                    height: 50,
                    width: MediaQuery.of(context).size.width / 5,
                    color: Colors.white60,
                  ),
                ),
              ),
              Obx(() {
                if (controller.codeError.value.isNotEmpty &&
                    !controller.codeError.value.contains('Le code de vérification est correcte')) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      controller.codeError.value,
                      style: TextStyle(
                        color: controller.codeError.value.contains(' Le code de vérification est correcte')
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
              const SizedBox(height: 105),
              Column(
                children: [
                  MyButton(
                    txt: "Continuer",
                    onPressed: () async {
                      if (validateFields()) {
                        String email = controller.emailController.text;
                        String code =
                            "${controller.c1.text}${controller.c2.text}${controller.c3.text}${controller.c4.text}";
                        if (code.length == 4) {
                          controller.verifyCode(email, code);
                        } else {
                          controller.codeError.value = "Le code doit être composé de 4 chiffres !";
                          print("Le code doit être composé de 4 chiffres !");
                        }
                      } else {
                        controller.codeError.value = "Veuillez remplir tous les champs du code !";
                        print("Veuillez remplir tous les champs du code !");
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
    if (controller.c1.text.isEmpty ||
        controller.c2.text.isEmpty ||
        controller.c3.text.isEmpty ||
        controller.c4.text.isEmpty) {
      return false;
    }
    return true;
  }
}
