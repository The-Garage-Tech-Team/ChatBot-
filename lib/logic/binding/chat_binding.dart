import 'package:get/get.dart';
import '../controller/chat_controller.dart';
import '../controller/chat_controller_1.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ChatContoller1());
    Get.put(ChatContoller());
    
  }
}
