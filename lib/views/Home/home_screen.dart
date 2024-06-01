import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/utils/utils.dart';
import '../../widgets/container/CustomContainer.dart';


class HomeScreen extends StatelessWidget {
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

            }
          ),
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),

                  child: Text(
                    'Bienvenue_au_PermitExpert'.tr,
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Color(0xFF09244B)),
                  ),

              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/images/image 296.png',
                width: 25,
                height: 25,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CustomContainer(
                  color: Color(0xFFDF7588),
                  imagePath: 'assets/images/capture_d___cran_2024-04-14_233651-removebg-preview_480 1.png',
                  text: 'Consulter_le_calendrier'.tr,
                  onPressed: (){
                    Get.toNamed(RouteHelper.calendarEvent);
                  }, imageWidth: 53,
                  imageHeight: 72,

                ),
              ),
              Center(
                child: CustomContainer(
                  color: Color(0xFFFA9135),
                  imagePath: 'assets/images/capture_d___cran_2024-04-15_001139-removebg-preview_480 1.png',
                  text: "Consulter_l'historique_de_paiement".tr,
                  onPressed: (){
                    Get.toNamed(RouteHelper.payment);   }, imageWidth: 125,



                  imageHeight: 99,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment:userRole == Roles.moniteur ? MainAxisAlignment.start : MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                color: Colors.lightGreen,
                imagePath: 'assets/images/Capture_d_écran_2024-04-14_233103-removebg-preview 1.png',
                text: 'Laisser_un_message'.tr,
                onPressed: (){
                  Get.toNamed(RouteHelper.contact);

                },  imageWidth: 92,
                imageHeight: 69,

              ).paddingOnly(left: 8),
              if(
                  userRole == Roles.candidat)
              Center(

                child: CustomContainer(
                  color: Color(0xFF60C1DC),

                  imagePath: 'assets/images/capture_d___cran_2024-04-15_001601-removebg-preview_480 1.png',
                  text: 'Apprendre_le_code'.tr,
                  onPressed: (){
                    Get.toNamed(RouteHelper.learnCode);
                    },
                  imageWidth: 123,
                  imageHeight: 69,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
