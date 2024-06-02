import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test2/routes/routes_helper.dart';
import 'package:test2/utils/theme_provider.dart';
import 'package:test2/views/en.dart';
import 'ar.dart';
import 'helper/dependencies.dart' as dep;
import 'fr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar_SA', null);
  await dep.init();
  await GetStorage.init();

  Get.put(ThemeController());

  String? savedLanguage = GetStorage().read('selected_language');
  print('Langue sauvegardée au démarrage de l\'application: $savedLanguage');

  if (savedLanguage != null) {
    if (savedLanguage == 'Français') {
      Get.updateLocale(Locale('fr', 'FR'));
    } else if (savedLanguage == 'Anglais') {
      Get.updateLocale(Locale('en', 'US'));
    } else if (savedLanguage == 'Arabe') {
      Get.updateLocale(Locale('ar', 'SA'));
    }
  }

  runApp(const MyApp());
}

class MultiTranslations extends Translations {
  final List<Translations> translationsList;

  MultiTranslations(this.translationsList);

  @override
  Map<String, Map<String, String>> get keys {
    final Map<String, Map<String, String>> mergedKeys = {};

    for (final translation in translationsList) {
      mergedKeys.addAll(translation.keys);
    }

    return mergedKeys;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isFirstTime = GetStorage().read('is_first_time') ?? true;
    final ThemeController themeController = Get.find();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        title: 'permitExpert',
        translations: MultiTranslations([Fr(), En(), Ar()]),
        locale: Get.locale ?? Locale('fr', 'FR'),
        fallbackLocale: Locale('fr', 'FR'),
        getPages: RouteHelper.routes,
        initialRoute: isFirstTime
            ? RouteHelper.getOnBoarding()
            : RouteHelper.getSignInPage(),
      );
    });
  }
}
