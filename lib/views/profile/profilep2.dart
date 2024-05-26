import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/edit_profile_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/my_botton/my_button.dart';

class ProfilePage2 extends GetView<EditProfileController> {
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
              Get.toNamed(RouteHelper.notifications);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: controller.getImage,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Container(
                      width: 152,
                      height: 152,
                      margin: EdgeInsets.only(
                          top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top - 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          if (controller.image.value != null)
                            ClipOval(
                              child: Image.file(
                                controller.image.value!,
                                fit: BoxFit.cover,
                                width: 152,
                                height: 152,
                              ),
                            ),
                          if (controller.image.value == null)
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
                              onTap: controller.getImage,
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
                    controller: controller.userNameController,
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
                    controller: controller.dateNaissanceController,
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
                    controller: controller.emailController,
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
                    controller: controller.numTelController,
                    decoration: InputDecoration(
                      hintText: 'Numéro de téléphone',
                      hintStyle: TextStyle(fontSize: 12, color: Color(0xFF4F4F51)),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  width: 328,
                  height: 50,
                  child: MyButton(
                    txt: 'Enregistrer',
                    onPressed: () {
                      controller.updateProfile();
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
