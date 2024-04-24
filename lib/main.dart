import 'package:flutter/material.dart';
import 'package:test2/constants/colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test2/views/onboarding//onboarding_view.dart';
import 'package:test2/views/login/login_ui.dart';
import 'package:test2/views/sign_up/sign_up.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importez flutter_svg

import 'package:get/get.dart';




void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isFirstTime = GetStorage().read('is_first_time') ?? true;

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myApplication',



      home: isFirstTime ? const OnboardingView() : const LoginScreen(),

    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // You can implement any logic you need here to decide whether to show login or signup screen
    // For simplicity, let's just show the login screen
    return const LoginUI();
  }
}
