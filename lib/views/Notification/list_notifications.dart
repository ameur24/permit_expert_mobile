import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/container/notificationContainer.dart';
import '../profile/profilep1.dart';

class ListNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return


      Scaffold(
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
      body: Container(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          children: [
            NotificationContainer(
              title: 'Lundi 23 Février',
              subtitle: '“Votre séance code est reporté au Mercredi”',
              date: 'maintenant',
            ),
            SizedBox(height: 10),
            NotificationContainer(
              title: 'Lundi 10 Mars',
              subtitle: '“Nous avons rappelons que votre examen de code est prévu pour Mardi 20 Mars à 9h”',
              date: 'Il y’a 19 min',
            ),
            SizedBox(height: 10),
            NotificationContainer(
              title: 'Lundi 23 Février',
              subtitle: '“Votre séance code est reporté au Mercredi”', date: 'Il y’a 58min',
            ),
            SizedBox(height: 10),
            NotificationContainer(
              title: 'Lundi 23 Février',
              subtitle: '“Votre séance code est reporté au Mercredi”', date: 'Il y’a 6 heures',
            ),
          ],
        ),
      ),
    );
  }
}
