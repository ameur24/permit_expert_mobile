import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:test2/views/onboarding//onboarding_view.dart';
import 'package:test2/views/login/login_ui.dart';
import 'helper/dependencies.dart' as dep;

import 'fr.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
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
      theme:ThemeData.light() ,
      title: 'permitExpert',
        translations: Fr(),
        locale: Locale('fr', 'FR'),
        fallbackLocale: Locale('fr', 'FR'),




      home: isFirstTime ? const OnboardingView() : const LoginScreen(),

    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return LoginUI();
  }
}
