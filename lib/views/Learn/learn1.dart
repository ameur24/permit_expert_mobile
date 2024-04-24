import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/views/Learn/learn3.dart';
import 'package:test2/views/Learn/learn4.dart';
import 'package:test2/views/Learn/learn5.dart';

import '../../widgets/container/greycontainer.dart';
import '../profile/profilep1.dart';
import 'Notification.dart';
import 'learn2.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apprendre le code',
          style: TextStyle(fontSize: 17, fontFamily: 'Poppins'),
        ),
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
          Container(
            width: 330,
            height: 181,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 78),
                child: Image.asset(
                  'assets/images/Capture_d_écran_2024-04-17_155431-removebg-preview.png',
                  width: 700,
                  height: 133,
                ),
              ),
            ),
          ),
          _buildCustomContainerWithProgress(
            'Série n° 1:',
            'Règles en Route',
            'assets/images/24 1.png',
            60,
            onPressed: () {
      Get.to(MyScreen());
            },
          ),
          _buildCustomContainerWithProgress(
            'Série n° 2:',
            'Sur la Voie de la Sécurité',
            'assets/images/26-removebg-preview 1.png',
            30,
            onPressed: () {
              Get.to(MyScreen1());
                 },
          ),
          _buildCustomContainerWithProgress(
            'Série n° 3:',
            'Les Signaux de la Route',
            'assets/images/27-removebg-preview 1.png',
            80,
            onPressed: () {
              Get.to(MyScreen2());            },
          ),
          _buildCustomContainerWithProgress(
            'Série n° 4:',
            'Conduite Maitrisée',
            'assets/images/may-removebg-preview 1.png',
            40,
            onPressed: () {
              Get.to(MyScreen3());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomContainerWithProgress(
      String text,
      String subtitle,
      String imagePath,
      int percent, {
        Function()? onPressed,
      }) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Column(
            children: [
              CustomContainer(
                text: text,
                subtitle: subtitle,
                imagePath: imagePath,
              ),
              SizedBox(height: 10),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 100,
            child: Container(
              width: 220,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 100 - percent,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 67,
            child: Text('$percent%', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
