import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/views/parametre.dart';
import 'package:test2/widgets/my_botton/my_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text('Profil'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 15),
              child: Text(
                'Mot de passe actuelle  :',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF707070),
                  fontFamily: 'poppins',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputBoxContainer(
                hintText: 'Mot de passe actuelle',
                iconColor: Color(0xFFA8AFB9),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Nouveau mot de passe:',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF707070),
                  fontFamily: 'poppins',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputBoxContainer(
                hintText: 'Nouveau mot de passe',
                iconColor: Color(0xFFA8AFB9),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Confirmer mot de passe:',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF707070),
                  fontFamily: 'poppins',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputBoxContainer(
                hintText: 'Confirmer mot de passe',
                iconColor: Color(0xFFA8AFB9),
              ),
            ),
            SizedBox(height: 70),

            // Bouton "Modifier"
            Container(
              width: 329,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: MyButton(
                  txt: 'Enregistrer',
                  onPressed: () {
                    Get.to(ParametresPage());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputBoxContainer extends StatelessWidget {
  final String hintText;
  final Color iconColor;

  const InputBoxContainer({required this.hintText, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.lock, color: iconColor),
          ),
          Expanded(
            child: TextFormField(
              obscureText: true, // hide input text
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFA8AFB9),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
