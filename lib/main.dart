import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test2/routes/routes_helper.dart';

import 'helper/dependencies.dart' as dep;

import 'fr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  await dep.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isFirstTime = GetStorage().read('is_first_time') ?? true;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'permitExpert',
      translations: Fr(),
      locale: Locale('fr', 'FR'),
      fallbackLocale: Locale('fr', 'FR'),
      //TODO :register all the routes here similar to login and use binding to intitialise controllers
      getPages: RouteHelper.routes,
      initialRoute: isFirstTime
          ? RouteHelper.getOnBoarding()
          : RouteHelper.getSignInPage(),
    );
  }
}
