import 'package:flutter/material.dart';

class OnboardingInfo extends StatelessWidget {
  final String heading;
  final String title;
  final String descriptions;
  final String imagePath;

  OnboardingInfo({
    required this.heading,
    required this.title,
    required this.descriptions,
    required this.imagePath,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            imagePath,

          ),
        ),

      ],
    );
  }
}
