import 'package:get/get.dart';
import 'package:test2/change_password.dart';
import 'package:test2/data/bindings/login_binding.dart';
import 'package:test2/views/Home/home_screen.dart';
import 'package:test2/views/Learn/learn1.dart';
import 'package:test2/views/Learn/learn2.dart';
import 'package:test2/views/Learn/learn3.dart';
import 'package:test2/views/Learn/learn4.dart';
import 'package:test2/views/Learn/learn_screen.dart';
import 'package:test2/views/MessageScreen.dart';
import 'package:test2/views/Notification/list_notifications.dart';
import 'package:test2/views/Paiement/paiement_screen.dart';
import 'package:test2/views/calendar/calendar_event.dart';
import 'package:test2/views/login/login_ui.dart';
import 'package:test2/views/onboarding/onboarding_view.dart';
import 'package:test2/views/parametre.dart';
import 'package:test2/views/profile/profilep1.dart';
import 'package:test2/views/profile/profilep2.dart';
import 'package:test2/views/sign_up/R%C3%A9initialisation.dart';
import 'package:test2/views/sign_up/VerificationScreen.dart';
import 'package:test2/views/sign_up/codeV%C3%A9rifMDP.dart';
import 'package:test2/views/sign_up/inscription.dart';
import 'package:test2/views/sign_up/mdpOublie.dart';
import '../data/bindings/calendar_binding.dart';
import '../data/bindings/change_pwd_binding.dart';
import '../data/bindings/edit_profile_binding.dart';
import '../data/bindings/learn_binding.dart';
import '../data/bindings/message_binding.dart';
import '../data/bindings/notification_binding.dart';
import '../data/bindings/sign_up_binding.dart';
import '../data/bindings/transaction_binding.dart';
import '../views/sign_up/sign_up.dart';

class RouteHelper {
  static const String initial = "/";
  static const String main = "/main";
  static const String onBoarding = "/onBoarding";
  static const String signIn = "/signIn";//login
  static const String forgottenMdp = "/forgottenMdp";//input email first
  static const String checkPwd = "/checkPwd ";// verification code for forgottenPassword

  static const String resetMdp = "/resetMdp";// new password

  static const String signEmail = "/signEmail";//email
  static const String checkCode= "/checkCode";//verification code for  register

  static const String signUp = "/signUp";//register
  static const String home = "/home";
  static const String learnCode = "/code";
  static const String learn1 = "/learn1";
  static const String learn2 = "/learn2";
  static const String learn3 = "/learn3";
  static const String learn4 = "/learn4";
  static const String contact = "/contact";
  static const String notifications = "/notifications";
  static const String payment = "/payment";
  static const String calendarEvent = "/calendar";
  static const String changePassword = "/changePassword";
  static const String parameter = "/parameter";
  static const String profile = "/profile";
  static const String editProfile = "/editProfile";






  //TODO : Add the other routes
  static String getInitial() => initial;
  static String getMain() => main;
  static String getOnBoarding() => onBoarding;
  static String getSignInPage() => signIn;
  static String getForgottenMdp() => forgottenMdp;//input email
  static String getCheckForgotPwd() => checkPwd;
  static  String geResetMdp() => resetMdp;//new password

  static String getSignUpPage() => signUp;//register
  static String getSignEmail() => signEmail;
  static String getHome() => home;
  static String getLearnCode()=>learnCode;
  static String getLearn1()=>learn1;
  static String getLearn2()=>learn2;
  static String getLearn3()=>learn3;
  static String getLearn4()=>learn4;
  static String getContact()=>contact;
  static String getNotifications()=>notifications;
  static String getPayment()=>payment;
  static String getCalendar()=>calendarEvent;
  static String getChangePassword()=>changePassword;
  static String getParameter()=>parameter;
  static String getProfile()=>profile;
  static String getEditProfile()=>editProfile;



  static List<GetPage> routes = [
    GetPage(
        name: onBoarding,
        page: () => OnboardingView(),
        binding: LoginBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: signIn,
        page: () => LoginUI(),
        binding: LoginBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: forgottenMdp,
        page: () => MdpOublie(),
        binding: SignUPBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
      name: checkPwd,
      page: () => VerificationMDP(),
      binding: SignUPBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: resetMdp,
        page: () => InscriMDP(),
        binding:SignUPBinding(),
        transition: Transition.cupertino,
    ),

    GetPage(
        name: signEmail,
        page: () => SignUp(),//write email for verification
        binding:SignUPBinding(),
        transition: Transition.cupertino,

    ),
    GetPage(
        name: checkCode,
        page: () => VerificationScreen(),//write email for verification
        binding: SignUPBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: signUp,
        page: () => Inscription(),//register
        binding: SignUPBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: home,
        page: () => HomeScreen(),
        binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
        name: learnCode,
        page: () => LearnScreen(),
        binding: LearnBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: learn1,
        page: () => MyScreen(),
        binding: LearnBinding(),
        transition: Transition.cupertino,

    ),
    GetPage(
        name: learn2,
        page: () => MyScreen1(),
        binding: LearnBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: learn3,
        page: () => MyScreen2(),
        binding: LearnBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: learn4,
        page: () => MyScreen3(),
        binding: LearnBinding(),
        transition: Transition.cupertino,
    ),

    GetPage(
        name: contact,
        page: () => MessageScreen(),
        binding: MessageBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: notifications,
        page: () => ListNotifications(),
        binding: NotificationBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: payment,
        page: () => PaymentScreen(),
        binding: TransactionBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: calendarEvent,
        page: () => CalendarScreen2(),
        binding: CalendarBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: changePassword,
        page: () => ChangePasswordScreen(),
        binding: ChangeBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: parameter,
        page: () => ParametresPage(),
        binding: ChangeBinding(),
        transition: Transition.cupertino,
    ),
    GetPage(
        name: profile,
        page: () => ProfilePage(),
        binding: EditProfileBinding(),
        transition: Transition.cupertino,
    ),  GetPage(
        name: editProfile,
        page: () => ProfilePage2(),
        binding: EditProfileBinding(),
        transition: Transition.cupertino,
    ),
    //TODO : Add the rest of screens here , use bindings in all of them to call controllers/repos
  ];
}
