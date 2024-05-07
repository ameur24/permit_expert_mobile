import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/views/Notification/notification.dart';
import 'package:test2/views/profile/profilep2.dart';
import 'package:test2/widgets/my_botton/my_button.dart';

import '../Notification/list_notifications.dart';
import '../login/login_ui.dart';
import '../parametre.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profil',
            style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.to(ListNotifications());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: getImage,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 0),
              child: Container(
                width: 152,
                height: 152,
                margin: EdgeInsets.only(
                    top: AppBar().preferredSize.height +
                        MediaQuery.of(context).padding.top -
                        10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    if (_image != null)
                      ClipOval(
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 152,
                          height: 152,
                        ),
                      ),
                    if (_image == null)
                      Center(
                        child: Icon(
                          Icons.account_circle,
                          size: 160,
                          color: Colors.grey,
                        ),
                      ),
                    Positioned(
                      bottom: 8,
                      right: 12,
                      child: GestureDetector(
                        onTap: getImage,
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'yosra besbes',
            style: TextStyle(fontSize: 22, fontFamily: 'Poppins'),
          ),
          SizedBox(height: 8),
          Text(
            '+21654727496',
            style: TextStyle(
                fontSize: 14, fontFamily: 'Poppins', color: Colors.grey),
          ),
          SizedBox(height: 23),

          // Bouton "Modifier"
          Container(
            width: 328,
            height: 45,
            child: MyButton(
              txt: 'Modifier'.tr,
              onPressed: () {
                Get.to(ProfilePage2());
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 360,
            height: 2,
            color: Color(0xFFE7E7E7),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ParametresPage());
            },
            child: ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text(
                'Paramètres'.tr,
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Poppins', color: Colors.black),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.signIn);
            },
            child: ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text(
                'Déconnexion'.tr,
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Poppins', color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
