import 'package:chatbot_template/view/screens/login_screen.dart';
import 'package:chatbot_template/view/screens/signup_screen.dart';
import 'package:get/get.dart';
import '../logic/binding/dashborard_binding.dart';
import '../logic/binding/login_bindings.dart';
import '../view/screens/dashborad_screen.dart';

class AppRoutes {
  static const dashboard = Routes.dashboardScreen;
  static const login = Routes.loginScreen;

  static final routes = [
    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      bindings: [
        DashboardBinding(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        DashboardBinding(),
        LoginBinding(),
      ],
    ),
  ];
}

class Routes {
  static const dashboardScreen = '/dashboardScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}
