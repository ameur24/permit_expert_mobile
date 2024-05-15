import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/container/PaiementContainer.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Paiement',
                  style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ],
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
                          'Solde Total',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '1567.800 DT',
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
                          'Débits',
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
                          '500 DT',
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
                          'Crédits',
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
                          '1067.800 DT',
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
                    'Historique de paiement',
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
                      'Voir Tous',
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
            PaiementContainer(
              title: 'Paiement 3h du code',
              subtitle: 'Mardi  12.05.2024',
              argentText: '40DT',
            ),
            SizedBox(height: 5),
            PaiementContainer(
              title: 'Facture eau',
              subtitle: 'Payé le 10 avril 2024',
              argentText: '50 DT',
            ),
            SizedBox(height: 5),
            PaiementContainer(
              title: 'Facture eau',
              subtitle: 'Payé le 10 avril 2024',
              argentText: '50 DT',
            ),
            SizedBox(height: 5),
            PaiementContainer(
              title: 'Facture eau',
              subtitle: 'Payé le 10 avril 2024',
              argentText: '50 DT',
            ),
            SizedBox(height: 5),
            PaiementContainer(
              title: 'Facture eau',
              subtitle: 'Payé le 10 avril 2024',
              argentText: '50 DT',
            ),
            SizedBox(height: 5),
            PaiementContainer(
              title: 'Facture eau',
              subtitle: 'Payé le 10 avril 2024',
              argentText: '50 DT',
            ),
          ],
        ),
      ),
    );
  }
}
