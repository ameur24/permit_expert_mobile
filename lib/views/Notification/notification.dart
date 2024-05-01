import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile/profilep1.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.to(ProfilePage());
              },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: 349,
                height: 502,
                child: Image.asset(
                  'assets/images/notif.png',
                  width: 347,
                  height: 502,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Aucune notification',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
