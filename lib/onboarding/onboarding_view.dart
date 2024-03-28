import 'package:flutter/material.dart';
import 'package:test2/my_ui/my_botton/my_button.dart';
import 'package:test2/onboarding/onboarding_items.dart';
import 'package:test2/my_ui/login_ui.dart';
import 'package:test2/my_ui/sign_up.dart';

import 'package:get_storage/get_storage.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingItems controller = OnboardingItems();
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: controller.items.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.items[index].heading,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(controller.items[index].image),
                      const SizedBox(height: 32),
                      _buildScrollingDots(controller.items.length, currentIndex),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          controller.items[index].title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          controller.items[index].descriptions,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
      MyButton(
        txt: "continuer",
        onPressed: () {
          GetStorage().write('is_first_time', false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
          },
      ),


            const SizedBox(height: 10),
            SubButton(
              txt: "ignorer",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollingDots(int itemCount, int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 17,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index == currentIndex ? Colors.orange : Colors.grey, // Vérifie si c'est l'index actuel
          ),
        ),
      ),
    );
  }

}
