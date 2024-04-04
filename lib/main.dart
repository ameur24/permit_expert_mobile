import 'package:flutter/material.dart';
import 'package:test2/my_tools/colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test2/onboarding/onboarding_view.dart';
import 'package:test2/my_ui/login_ui.dart';
import 'package:test2/my_ui/sign_up.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isFirstTime = GetStorage().read('is_first_time') ?? true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myApplication',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: MyBackgroundColor),
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
