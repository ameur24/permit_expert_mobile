import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import '../../data/controllers/signup_controller.dart';

class MdpOublie extends GetView<SignUpController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 MdpOublie({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Image.asset(
                  "assets/images/Permit_3__4-removebg-preview.png",
                  height: 147,
                  width: 171,
                ),
                const SizedBox(height: 32),
                Text(
                  "Récupération du Mot de passe",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Commençons avec votre adresse e-mail",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 96),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: ' Adresse Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'L\'adresse email est obligatoire';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'L\'adresse email n\'est pas valide';
                          }
                          return null;
                        },
                      ),
                    ),
                    Obx(() {
                      if (controller.checkEmailError.value.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            controller.checkEmailError.value,
                            style: TextStyle(
                              color: controller.checkEmailError.value ==
                                  'Votre email est correcte'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                    const SizedBox(height: 118),
                    MyButton(
                      txt: "Continue",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.checkEmailForPassword(
                              controller.emailController.text);
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


