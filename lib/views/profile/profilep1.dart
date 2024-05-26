import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import '../../data/controllers/edit_profile_controller.dart';
import '../../widgets/my_botton/my_button.dart';

class ProfilePage extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return _buildProfileContent(context);
        }
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context),
        SizedBox(height: 20),
        Text(
          controller.userNameController.text,
          style: TextStyle(fontSize: 22, fontFamily: 'Poppins'),
        ),
        SizedBox(height: 8),
        Text(
          controller.numTelController.text,
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins', color: Colors.grey),
        ),
        SizedBox(height: 23),
        _buildEditButton(),
        SizedBox(height: 20),
        Divider(color: Color(0xFFE7E7E7), thickness: 2),
        _buildSettingsOption(),
        _buildLogoutOption(),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: controller.getImage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Container(
          width: 152,
          height: 152,
          margin: EdgeInsets.only(
            top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top - 10,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle),
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
                )
              else
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
                    child: Icon(Icons.add, size: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Container(
      width: 328,
      height: 45,
      child: MyButton(
        txt: 'Modifier'.tr,
        onPressed: () {
          Get.toNamed(RouteHelper.editProfile);
        },
      ),
    );
  }

  Widget _buildSettingsOption() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.parameter);
      },
      child: ListTile(
        leading: Icon(Icons.settings, color: Colors.black),
        title: Text(
          'Paramètres'.tr,
          style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildLogoutOption() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.signIn);
      },
      child: ListTile(
        leading: Icon(Icons.exit_to_app, color: Colors.black),
        title: Text(
          'Déconnexion'.tr,
          style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.black),
        ),
      ),
    );
  }
}
