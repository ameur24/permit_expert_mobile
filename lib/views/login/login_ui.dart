import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/auth_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/my_botton/my_button.dart';


class LoginUI extends GetView<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginUI({Key? key}) : super(key: key);

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
                  'assets/images/Permit_3__4-removebg-preview.png',
                  height: 147,
                  width: 171,
                ),
                const SizedBox(height: 32),
                Text(
                  "Connexion",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Bienvenue sur Permit Expert",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 42),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Le champ email est obligatoire';
                          }
                          if (!value.contains('@gmail.com')) {
                            return 'Veuillez saisir une adresse email valide (@gmail.com)';
                          }
                          return null;
                        },
                        controller:controller.emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
                      child:TextFormField(
                        validator: (v){
                          if(v!.isEmpty)
                            return 'Le mot de passe est obligatoire';
                   if(v.length<8)
                     return 'Le mot de passe doit avoir plus que 8 caracteres ';
                          return null;
                        },
                        controller:controller. passwordController,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.forgottenMdp);

                      },
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    MyButton(
                      onPressed: () {
                if (_formKey.currentState!.validate())
                        controller.login(
                            controller.emailController.text, controller.passwordController.text);

                      },
                      txt: 'Se connecter',
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous n'avez pas de compte ?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(RouteHelper.signEmail);

                          },
                          child: Text(
                            "S'inscrire",
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
      ),
    );
  }
}
