import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes_helper.dart';
import '../widgets/my_botton/my_button.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Laisser votre message',
            style: TextStyle(fontSize: 17),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed(RouteHelper.notifications);

            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.toNamed(RouteHelper.profile);


            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/6648544-girl-using-mobile-phone-texting-messaging-or-chatting-with-friends-online-looking-at-smart-phone-concept-illustration-gratuit-vectoriel 1 (1).png', // Chemin de votre image
                width: 350,
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: 318,
                height: 203,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Laissez votre message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            MyButton(
              txt: 'Envoyer',
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
