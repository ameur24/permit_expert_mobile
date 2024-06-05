import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/learn_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/container/greycontainer.dart';

class LearnScreen extends GetView<LearnController> {
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
              width: 345,
              height: 181,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset(
                    'assets/images/Capture_d_écran_2024-04-17_155431-removebg-preview.png',
                    width: 800,
                    height: 140,
                  ),
                ),
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              } else {
                final Set<String> displayedSeries = {};
                return Column(
                  children: controller.resources.where((resource) {
                    if (displayedSeries.contains(resource.series)) {
                      return false;
                    } else {
                      displayedSeries.add(resource.series);
                      return true;
                    }
                  }).map((resource) {
                    String imagePath = _getImagePathForSeries(resource.series);
                    return _buildCustomContainerWithProgress(
                      resource.series,
                      resource.title,
                      imagePath,
                      60,
                      onPressed: () {
                        if (resource.series == 'Série n°1') {
                          Get.toNamed(RouteHelper.learn1);
                        } else if (resource.series == 'Série n°2') {
                          Get.toNamed(RouteHelper.learn2);
                        } else if (resource.series == 'Série n°3') {
                          Get.toNamed(RouteHelper.learn3);
                        } else if (resource.series == 'Série n°4') {
                          Get.toNamed(RouteHelper.learn4);
                        }
                      },
                    );
                  }).toList(),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  String _getImagePathForSeries(String series) {
    switch (series) {
      case 'Série n°1':
        return 'assets/images/24 1.png';
      case 'Série n°2':
        return 'assets/images/26-removebg-preview 1.png';
      case 'Série n°3':
        return 'assets/images/27-removebg-preview 1.png';
      case 'Série n°4':
        return 'assets/images/may-removebg-preview 1.png';
      default:
        return 'assets/images/stop-removebg-preview.png';
    }
  }

  Widget _buildCustomContainerWithProgress(
      String text,
      String subtitle,
      String imagePath,
      int? percent, {
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
          if (percent != null)
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
          if (percent != null)
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
