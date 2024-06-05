import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/learn_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/container/greencontainer.dart';
import '../../widgets/container/learnContainer.dart';
import '../../widgets/container/vidcontainer.dart';

class MyScreen1 extends GetView<LearnController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          SizedBox(height: 30),

          GreenContainer(
            titre: controller.resources
                .where((resource) => resource.series == 'Série n°2')
                .first
                .series,
            sousTitre: controller.resources
                .where((resource) => resource.series == 'Série n°2')
                .first
                .title,
            imageUrl: "assets/images/26-removebg-preview 1.png",
            imageWidth: 160,
            imageHeight: 150,
          ),


          SizedBox(height: 10),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.resources
                      .where((resource) => resource.series == 'Série n°2')
                      .length,
                  itemBuilder: (context, index) {
                    final resource = controller.resources
                        .where((resource) => resource.series == 'Série n°2')
                        .toList()[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),

                        child: LearnContainer(
                          containerWidth: 310,
                          containerHeight: 111,
                          barWidth: 2,
                          barHeight: 70,
                          title: resource.description,
                          link: resource.link,
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
          SizedBox(height: 10),

        ],
      ),
    );
  }
}