import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import 'package:test2/views/login/login_ui.dart';

class Inscription extends StatelessWidget {
  const Inscription({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Permit_3__4-removebg-preview.png",
                height: 147,
                width: 171,
              ),
              const SizedBox(height: 32),
              Text(
                "Inscription",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'poppins',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Remplissez le formulaire pour continuer",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              buildShadowedTextField(
                hintText: 'Nom d\'utilisateur',
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 10),
              buildShadowedTextField(
                hintText: 'Numéro de téléphone',
                prefixIcon: Icons.phone,
              ),
              const SizedBox(height: 10),
              buildShadowedTextField(
                hintText: 'Mot de passe',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              buildShadowedTextField(
                hintText: 'Confirmer votre mot de passe',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              MyButton(
                txt: "Continue",
                onPressed: () {
                  print("Le bouton 'Continue' a été pressé !");
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
                      "Se connecter",
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
        ),
      ),
    );
  }

  Widget buildShadowedTextField({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Container(
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
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(prefixIcon, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}
