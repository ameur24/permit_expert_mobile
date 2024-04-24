import 'package:flutter/material.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import 'package:test2/views/login/login_ui.dart';

import 'VerificationScreen.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                "Commençons avec votre adresse e-mail",
                style: TextStyle(
                  fontSize: 14,
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
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
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
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 105),
                  MyButton(
                    txt: "Continue",
                    onPressed: () {
                      print("Le bouton 'Se Connecter' a été pressé !");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerificationScreen()),
                      );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginUI()),
                          );
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
            ],
          ),
        ),
      ),
    );
  }
}
