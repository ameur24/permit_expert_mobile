import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test2/views/Notification/notification.dart';
import 'package:test2/views/profile/profilep1.dart';

import '../../widgets/my_botton/my_button.dart';
import '../Notification/list_notifications.dart';

class ProfilePage2 extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage2> {
  File? _image;
  final picker = ImagePicker();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: getImage,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 0,),
                child: Container(
                  width: 152,
                  height: 152,
                  margin: EdgeInsets.only(top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top - 10),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Nom utilisateur',
                  hintStyle: TextStyle(fontSize: 12, color: Color(0xFF4F4F51)),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Date de naissance',
                  hintStyle: TextStyle(fontSize: 12, color: Color(0xFF4F4F51)),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 12, color: Color(0xFF4F4F51)),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Numéro de téléphone',
                  hintStyle: TextStyle(fontSize: 12, color: Color(0xFF4F4F51)),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 70),

            // Bouton "Modifier"
            Container(
              width: 328,
              height: 50,
              child: MyButton(
                txt: 'Enregistrer',
                onPressed: () {
                  Get.to(ProfilePage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}