import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animation'),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/animations/car.json',
          width: 500,
          height: 300,
          repeat: true,
        ),
      ),
    );
  }
}