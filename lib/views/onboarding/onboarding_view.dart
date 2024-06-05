import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/widgets/my_botton/my_button.dart';
import 'package:test2/views/onboarding/onboarding_items.dart';
import 'package:test2/views/sign_up/sign_up.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: controller.items.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          item.heading,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        item.imagePath,

                      ),
                      const SizedBox(height: 30),
                      _buildScrollingDots(controller.items.length, currentIndex),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          item.descriptions,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'poppins',
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
                if (currentIndex < controller.items.length - 1) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  GetStorage().write('is_first_time', false);
                 Get.toNamed(RouteHelper.signEmail);
                }
              },
            ),
            const SizedBox(height: 10),
            SubButton(
              txt: "ignorer",
              onPressed: () {
                Get.toNamed(RouteHelper.signEmail);
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
            color: index == currentIndex ? Colors.orange : Colors.grey,
          ),
        ),
      ),
    );
  }
}
