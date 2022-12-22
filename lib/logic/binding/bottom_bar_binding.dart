import 'package:get/get.dart';
import '../controller/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomBarController());
  }
}