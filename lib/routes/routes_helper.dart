import 'package:get/get.dart';
import 'package:test2/data/bindings/login_binding.dart';
import 'package:test2/main.dart';
import 'package:test2/views/login/login_ui.dart';
import 'package:test2/views/onboarding/onboarding_view.dart';

class RouteHelper {
  static const String initial = "/";
  //Login
  static const String signIn = "/signIn";
  static const String onBoarding = "/onBoarding";
  //TODO : Add the other routes

  static String getSignInPage() => signIn;
  static String getOnBoarding() => onBoarding;

  static List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnboardingView()),

    //Login screen
    GetPage(name: signIn, page: () => LoginUI(), binding: LoginBinding()),
    //TODO : Add the rest of screens here , use bindings in all of them to call controllers/repos
  ];
}
