import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/utils/utils.dart';
import '../../data/controllers/transaction_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/container/PaiementContainer.dart';

class PaymentScreen extends GetView<TransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Paiement'.tr,
            style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.transactions.isEmpty) {
          return Center(
            child: Text(
              'Aucune_transaction_disponible'.tr,
              style: TextStyle(fontSize: 20, color: Colors.grey, fontFamily: 'Poppins'),
            ),
          );
        } else {
          double totalDebits = controller.calculateTotalDebits();
          double totalCredits = controller.calculateTotalCredits();
          double totalBalance = userRole == Roles.moniteur
              ? controller.calculateTotalBalanceMoniteur()
              : controller.calculateTotalBalanceCandidat();

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Center(
                    child: Container(
                      width: 340,
                      height: 109,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8F9BB3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text(
                              'Solde_Total'.tr,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              '$totalBalance DT',
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                if (userRole == Roles.moniteur)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 167,
                        height: 81,
                        decoration: BoxDecoration(
                          color: Color(0xFF9DCD5A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: Text(
                                'Débits'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(
                                '$totalDebits DT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 167,
                        height: 81,
                        decoration: BoxDecoration(
                          color: Color(0xFFFA7F35),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text(
                                'Crédits'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Text(
                                '$totalCredits DT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Historique_de_paiement'.tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Color(0xFF858585),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Text(
                          'Voir_Tous'.tr,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Color(0xFFFA7F35),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...controller.transactions.map((transaction) {
                  return Column(
                    children: [
                      PaiementContainer(
                        title: transaction.description,
                        subtitle: transaction.dateT,
                        argentText: '${transaction.montantT} DT',
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        }
      }),
    );
  }
}
