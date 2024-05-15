import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/widgets/my_botton/my_button.dart';

import '../../data/controllers/signup_controller.dart';

class Inscription extends GetView<SignUpController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Inscription({Key? key});

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
                  controller: controller.usernameController,
                  hintText: 'Nom d\'utilisateur',
                  prefixIcon: Icons.person,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ nom d\'utilisateur est obligatoire';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                buildShadowedTextField(
                  hintText: 'Numéro de téléphone',
                  prefixIcon: Icons.phone,
                  textInputType: TextInputType.number,
                  controller: controller.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ numéro de téléphone est obligatoire';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Le numéro de téléphone ne doit contenir que des chiffres';
                    }
                    if (value.length > 8) {
                      return 'Le numéro de téléphone ne doit pas dépasser 8 caractères';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                buildShadowedTextField(
                  hintText: 'Mot de passe',
                  prefixIcon: Icons.lock,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ mot de passe est obligatoire';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                buildShadowedTextField(
                  hintText: 'Confirmer votre mot de passe',
                  prefixIcon: Icons.lock,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  controller: controller.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ de confirmation du mot de passe est obligatoire';
                    }
                    if (value != controller.passwordController.text) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                MyButton(
                  txt: "S'inscrire",
                  onPressed: () {
                    if (_validate()) {
                      controller.updateProfile(
                        controller.emailController.text,
                        controller.usernameController.text,
                        controller.phoneController.text,
                        controller.passwordController.text,
                        controller.confirmPasswordController.text,
                      );
                      print("Le bouton 'Continue' a été pressé !");
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
                        "Se connecter'",
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
      ),
    );
  }

  Widget buildShadowedTextField({
    required TextEditingController controller,
    required String hintText,
     TextInputType textInputType = TextInputType.text,
    required IconData prefixIcon,
    bool isPassword = false,
    required String? Function(String?)? validator,
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
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
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

  bool _validate() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
