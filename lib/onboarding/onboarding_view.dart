import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test2/my_ui/my_botton/my_button.dart';
import 'package:test2/onboarding/onboarding_items.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingView> {
  final controller =OnboardingItems();
  final pageController =PageController();
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
              itemBuilder: (context , index){
           return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(controller.items[index].heading, textAlign:TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold) ,
               ),
               const SizedBox(height: 10),

               Image.asset(controller.items[index].image),
               const SizedBox(height: 32),
               Column(
               children: [
               SmoothPageIndicator(
               controller: pageController,
               count: controller.items.length,
               onDotClicked: (index)=>pageController.animateToPage(index, duration: Duration(milliseconds: 600), curve: Curves.easeIn),
               effect: WormEffect(
            dotHeight: 12,
               dotWidth: 12,
               activeDotColor: Colors.orange,
               dotColor: Colors.grey,
               ),
               ),
            const SizedBox(height: 10),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20), // Changer 20 par la valeur désirée
                   child: Text(
                     controller.items[index].title,
                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                   ),
                 ),


                 Container(
              margin: EdgeInsets.only(left: 20, right: 20), // Adjust left margin as needed
              child: Text(
                controller.items[index].descriptions,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),




               ],
               ),
               ],
           );
              },
           ),
         ),
         MyButton(txt: "continue", onPressed: ()=>pageController.nextPage(duration: Duration(milliseconds:600), curve: Curves.easeIn),),

         const SizedBox(height: 10),
         SubButton(txt: "ignorer",
             onPressed:()=>pageController.jumpToPage(controller.items.length-1)
         )
       ],
     ),

      ),


    );
  }
}
