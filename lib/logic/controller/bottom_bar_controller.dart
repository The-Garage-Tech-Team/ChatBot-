import 'package:get/get.dart';

import '../../view/screens/home_screen.dart';
import '../../view/screens/profile_screen.dart';
import '../../view/screens/settings_screen.dart';
import '../../view/screens/trending_screen.dart';

class BottomBarController extends GetxController {
  int currentIndex = 3;

  final List<Map<String, dynamic>> pages = [
    {'title': 'Home', 'screen': const HomeScreen()},
    {'title': 'Profile', 'screen': const ProfileScreen()},
    {'title': 'Trending', 'screen': const TrendingScreen()},
    {'title': 'Settings', 'screen': SettingsScreen()},
  ];

  void selectedPage(index) {
    currentIndex = index;
    update();
  }
}
