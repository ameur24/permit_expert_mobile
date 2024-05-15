import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/views/profile/profilep1.dart';

import '../../routes/routes_helper.dart';
import '../../widgets/container/greencontainer.dart';
import '../../widgets/container/learnContainer.dart';
import '../../widgets/container/vidcontainer.dart';
import '../Notification/list_notifications.dart';

class MyScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed(RouteHelper.notifications);

             // Get.to(ListNotifications());
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.toNamed(RouteHelper.profile);

            //  Get.to(ProfilePage());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          GreenContainer(
            titre:  'Série_nb'.tr+' 3',
            sousTitre:  'Les_Signaux_de_la_Route'.tr,
            imageUrl: "assets/images/may-removebg-preview 1.png",
            imageWidth: 150,
            imageHeight: 150,
          ),
          SizedBox(height: 10),
          LearnContainer(
            containerWidth: 325,
            containerHeight: 111,
            barWidth: 2,
            barHeight: 70,
            title: 'Voici_une_ressource_qui_peut_vous_aider:'.tr,
            link: "https://www.ressource.com/",
          ),
          SizedBox(height: 10),
          LearnContainer(
            containerWidth: 330,
            containerHeight: 111,
            barWidth: 2,
            barHeight: 75,
            title: 'Voici_un_test_en_ligne_qui_peut_vous_aider:'.tr,
            link: "https://www.permisecole.com/code/gratuit",
          ),
          SizedBox(height: 10),
          VContainer(
            containerWidth: 325,
            containerHeight: 260,
            barWidth: 2,
            barHeight: 228,
            title: 'Voici_quelques_vidéos_qui_peuvent_vous_aider:'.tr,
            imagePaths: [
              'assets/images/vid1.png',
              'assets/images/vid1.png',
              'assets/images/vid1.png',

              'assets/images/vid1.png',
              'assets/images/vid1.png',
              'assets/images/vid1.png',
            ],
            imageUrls: [
              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',
              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',
              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',

              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',
              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',
              'https://www.youtube.com/watch?v=392Kf6pjNjs&ab_channel=IbraheemAlHosani',
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
