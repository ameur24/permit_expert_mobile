import 'package:flutter/material.dart';
import 'package:test2/my_tools/colors.dart';
import 'package:test2/my_ui/login_ui.dart';
import 'package:test2/onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myApplication',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: MyBackgroundColor),
      home: const OnboardingView(),
    );
  }
}


