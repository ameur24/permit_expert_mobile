import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/my_botton/my_button.dart';
import 'data/controllers/change_pwd_controller.dart';

class ChangePasswordScreen extends GetView<ChangePwdController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text('Profil'.tr),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 115, left: 15),
                child: Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    'Mot_de_passe_actuel:'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707070),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InputBoxContainer(
                    hintText: 'Mot_de_passe_actuel'.tr,
                    iconColor: Color(0xFFA8AFB9),
                    controller: controller.oldPasswordController,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  'Nouveau_mot_de_passe:'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF707070),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InputBoxContainer(
                    hintText: 'Nouveau_mot_de_passe'.tr,
                    iconColor: Color(0xFFA8AFB9),
                    controller: controller.newPasswordController,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Confirmer_mot_de_passe:'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707070),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InputBoxContainer(
                    hintText: 'Confirmer_mot_de_passe'.tr,
                    iconColor: Color(0xFFA8AFB9),
                    controller: controller.confirmPasswordController,
                  ),
                ),
              ),
              SizedBox(height: 70),
              Container(
                width: 329,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: MyButton(
                    txt: 'Enregistrer'.tr,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.changePassword();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputBoxContainer extends StatelessWidget {
  final String hintText;
  final Color iconColor;
  final TextEditingController controller;

  const InputBoxContainer({
    required this.hintText,
    required this.iconColor,
    required this.controller,
  });

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
            offset: Offset(0, 1),
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
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFA8AFB9),
                ),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce_champ_est_obligatoire'.tr;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
