import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import '../data/controllers/edit_profile_controller.dart';

class ParametresPage extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Paramètres')),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return Column(
                      children: [
                        // Display user image here
                        // Replace Icon with user image
                        Icon(
                          Icons.account_circle,
                          size: 160,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Text(
                          controller.userNameController.text,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).textTheme.titleLarge?.color,
                          ),
                        ),
                        Text(
                          controller.numTelController.text,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ),
              SizedBox(height: 35),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.nightlight_round),
                      title: Text('Mode nuit'),
                      trailing: Container(
                        width: 60,
                        height: 5,
                        child: CupertinoSwitch(
                          value: false, // Change this to your actual value
                          onChanged:(value){},
                          activeColor: Colors.black,
                          trackColor: Colors.grey,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                      trailing: Container(
                        width: 60,
                        height: 5,
                        child: CupertinoSwitch(
                          value: false, // Change this to your actual value
                          onChanged: (value) {},
                          activeColor: Colors.black,
                          trackColor: Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.changePassword);
                      },
                      child: ListTile(
                        leading: Icon(Icons.lock),
                        title: Text('Changer mot de passe'),
                      ),
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.language),
                      title: Text('Choisir langage'),
                      children: controller.languageOptions.map((String language) {
                        return RadioListTile(
                          title: Text(language),
                          value: language,
                          groupValue: controller.selectedLanguage.value,
                          onChanged: (String? value) {
                            controller.selectedLanguage.value = value!;
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
