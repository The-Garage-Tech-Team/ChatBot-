import 'package:chatbot_template/utils/constants.dart';
import 'package:chatbot_template/logic/controller/chat_controller.dart';
import 'package:chatbot_template/logic/controller/login_controller.dart';
import 'package:chatbot_template/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'chat_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final chatController = Get.put(ChatContoller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: kBlackColor,
                ),
              ),
              elevation: 0,
              backgroundColor: kBackgroundColor,
              leading: GestureDetector(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: kBlackColor,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  const Text(
                    'Hello Ahmed !',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: ListTile(
                      leading: Image.asset('assets/images/profileedit.png'),
                      title: const Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        // chatController.getChatID(chatController.currentUserID);
                        Get.to(() => ChatScreen(
                              selectedUserID: chatController.currentUserID,
                            ));
                      },
                      child: ListTile(
                        leading: Image.asset('assets/images/contact.png'),
                        title: const Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: ListTile(
                      leading: Image.asset('assets/images/subs.png'),
                      title: const Text(
                        'Subscriptions',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: ListTile(
                      leading: Image.asset('assets/images/notification.png'),
                      title: const Text(
                        'Notifications',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: SizedBox(
                        width: 50,
                        child: FlutterSwitch(
                          value: true,
                          activeColor: Colors.green,
                          onToggle: (val) {},
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: GestureDetector(
                      onTap: () {
                        controller.signout();
                        Get.to(LoginScreen());
                      },
                      child: const Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
