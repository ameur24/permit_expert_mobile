import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import '../../data/controllers/signup_controller.dart';

class InscriMDP extends GetView<SignUpController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  InscriMDP({Key? key});

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
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/Permit_3__4-removebg-preview.png",
                  height: 147,
                  width: 171,
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    "Réinitialisation du mot de passe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
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
                  hintText: ' Nouveau Mot de passe',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  controller: controller.newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ nouveau mot de passe est obligatoire';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                buildShadowedTextField(
                  hintText: 'Confirmer votre mot de passe',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  controller: controller.confirmNewPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le champ de confirmation du mot de passe est obligatoire';
                    }
                    if (value != controller.newPasswordController.text) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 69),
                MyButton(
                  txt: "Continue",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.updatePassword(
                        controller.emailController.text,
                        controller.newPasswordController.text,
                        controller.confirmNewPasswordController.text,
                      );
                      Get.snackbar(
                        "Succès",
                        "Mot de passe réinitialisé",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      print("Le bouton 'Continue' a été pressé !");
                    }
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildShadowedTextField({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
    required TextEditingController controller,
    String? Function(String?)? validator,
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
