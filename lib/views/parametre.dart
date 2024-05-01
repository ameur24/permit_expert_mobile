import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../change_password.dart';
import '../utils/utils.dart';

class ParametresPage extends StatefulWidget {
  @override
  _ParametresPageState createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  bool _notificationsActive = false;
  bool _notificationActive = false;
  File? _image;
  String _selectedLanguage = 'Français';
  List<String> _languageOptions = ['Français', 'Arabe', 'Anglais'];

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Aucune image sélectionnée.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: currentTheme,
      child: Scaffold(
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
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 160,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'yosra besbes',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      ),
                      Text(
                        '+216 20 123 123',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
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
                            value: _notificationsActive,
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
                            value: _notificationActive,
                            onChanged: (value) {
                              setState(() {
                                _notificationActive = value;
                              });
                            },
                            activeColor: Colors.black,
                            trackColor: Colors.grey,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ChangePasswordScreen());
                        },
                        child: ListTile(
                          leading: Icon(Icons.lock),
                          title: Text('Changer mot de passe'),
                        ),
                      ),

                      ExpansionTile(
                        leading: Icon(Icons.language),
                        title: Text('Choisir langage'),
                        children: _languageOptions.map((String language) {
                          return RadioListTile(
                            title: Text(language),
                            value: language,
                            groupValue: _selectedLanguage,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedLanguage = value!;
                              });
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
      ),
    );
  }
}