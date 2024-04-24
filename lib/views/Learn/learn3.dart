import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/views/Learn/Notification.dart';
import 'package:test2/views/profile/profilep1.dart';

import '../../widgets/container/greencontainer.dart';
import '../../widgets/container/learnContainer.dart';
import '../../widgets/container/vidcontainer.dart';

class MyScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.to(NotificationsScreen());
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.to(ProfilePage());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          GreenContainer(
            titre: "Série n° 1 :",
            sousTitre: "Règles en Route",
            imageUrl: "assets/images/26-removebg-preview 1.png",
            imageWidth: 150,
            imageHeight: 150,
          ),
          SizedBox(height: 10),
          LearnContainer(
            containerWidth: 325,
            containerHeight: 111,
            barWidth: 2,
            barHeight: 70,
            title: "Voici une ressource qui peut vous aider:",
            link: "https://www.ressource.com/", // Ajoutez le lien ici
          ),
          SizedBox(height: 10),
          LearnContainer(
            containerWidth: 330,
            containerHeight: 111,
            barWidth: 2,
            barHeight: 75,
            title: "Voici un test en ligne qui peut vous aider:",
            link: "https://www.permisecole.com/code/gratuit", // Ajoutez le lien ici
          ),
          SizedBox(height: 10),
          VContainer(
            containerWidth: 325,
            containerHeight: 260,
            barWidth: 2,
            barHeight: 228,
            title: 'Voici quelques vidéos qui peuvent vous aider:',
            imagePaths: [
              'assets/images/vid1.png',
              'assets/images/vid1.png',
              'assets/images/vid1.png',
              // Ajout des chemins d'images pour la deuxième rangée
              'assets/images/vid1.png',
              'assets/images/vid1.png',
              'assets/images/vid1.png',
            ],
            imageUrls: [
              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',
              'https://www.url2.com',
              'https://www.url3.com',
              'https://www.url4.com',
              'https://www.url5.com',
              'https://www.url6.com',
            ],
            imageWidths: [
              82,
              82,
              82,

              82,
              82,
              82,
            ],
            imageHeights: [
              68,
              68,
              68,

              68,
              68,
              68,
            ],
          ),
        ],
      ),
    );
  }
}
