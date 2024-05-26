import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/container/greycontainer.dart';


class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apprendre_le_code'.tr,
          style: TextStyle(fontSize: 17, fontFamily: 'Poppins'),
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
              'Série_nb'.tr+' 1',
              'Règles_en_Route'.tr,
              'assets/images/24 1.png',
              60,
              onPressed: () {
                Get.toNamed(RouteHelper.learn1);

              },
            ),
            _buildCustomContainerWithProgress(
              'Série_nb'.tr+' 2',
              'Sur_la_Voie_de_la_Sécurité'.tr,
              'assets/images/26-removebg-preview 1.png',
              30,
              onPressed: () {
                Get.toNamed(RouteHelper.learn2);
              },
            ),
            _buildCustomContainerWithProgress(
              'Série_nb'.tr+' 3',
              'Les_Signaux_de_la_Route'.tr,
              'assets/images/27-removebg-preview 1.png',
              80,
              onPressed: () {
                Get.toNamed(RouteHelper.learn3);
              },
            ),
            _buildCustomContainerWithProgress(
              'Série_nb'.tr+' 4',
              'Conduite_Maitrisée'.tr,
              'assets/images/may-removebg-preview 1.png',
              40,
              onPressed: () {
                Get.toNamed(RouteHelper.learn4);

              },
            ),
          ],
        ),
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
