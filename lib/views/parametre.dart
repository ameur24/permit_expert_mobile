import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/data/controllers/edit_profile_controller.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/theme_provider.dart';

class ParametresPage extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Paramètres'.tr)),
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
                      title: Text('Mode_nuit'.tr),
                      trailing: Container(
                        width: 60,
                        height: 5,
                        child: Obx(() {
                          return CupertinoSwitch(
                            value: themeController.isDarkMode.value,
                            onChanged: (value) {
                              themeController.toggleDarkMode();
                            },
                            activeColor: Colors.black,
                            trackColor: Colors.grey,
                          );
                        }),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'.tr),
                      trailing: Container(
                        width: 60,
                        height: 5,
                        child: CupertinoSwitch(
                          value: false,
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
                        title: Text('Changer_mot_de_passe'.tr),
                      ),
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.language),
                      title: Text('Choisir_langage'.tr),
                      children: controller.languageOptions.map((String language) {
                        return RadioListTile(
                          title: Text(language),
                          value: language,
                          groupValue: controller.selectedLanguage.value,
                          onChanged: (String? value) {
                            if (value != null) {
                              controller.selectedLanguage.value = value;
                              if (value == 'Français') {
                                Get.updateLocale(Locale('fr', 'FR'));
                              } else if (value == 'Anglais') {
                                Get.updateLocale(Locale('en', 'US'));
                              } else if (value == 'Arabe') {
                                Get.updateLocale(Locale('ar', 'SA'));
                              }
                              GetStorage().write('selected_language', value);
                              print('Updated locale: ${Get.locale}');
                            }
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
