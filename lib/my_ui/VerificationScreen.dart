import 'package:flutter/material.dart';
import 'package:test2/my_ui/my_botton/my_button.dart';
import 'package:test2/my_ui/login_ui.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Permit_3__4__1_-removebg-preview.png",
              height: 147,
              width: 171,
            ),
            const SizedBox(height: 12),
            Text(
              "Code de vérification",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Nous avons envoyé le code de vérification à votre adresse e-mail",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height:120),
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

                const SizedBox(height: 120),
                MyButton(
                  txt: "Se Connecter", // Changed button text for consistency
                  onPressed: () {
                    print("Le bouton 'Se Connecter' a été pressé !");
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous avez déja un compte ?",
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
                        );                      },
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
    );
  }
}
