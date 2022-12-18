import 'package:chatbot_template/logic/controller/login_controller.dart';
import 'package:get/instance_manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
