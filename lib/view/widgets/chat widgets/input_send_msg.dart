import 'package:chatbot_template/utils/constants.dart';
import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InputMsg extends StatelessWidget {
  final chatController = Get.put(ChatContoller1());
  final messageEditingController = TextEditingController();
  final Color iconColor;
  final String selectedUserID;

  InputMsg({
    this.iconColor = Colors.grey,
    Key? key,
    required this.selectedUserID,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1, color: Color.fromRGBO(243, 244, 246, 1))),
        ),
        child: TextField(
            controller: messageEditingController,
            onChanged: (value) {
              chatController.message = value;
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(color: kBlackColor),
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: 'Write a message',
                hintStyle: const TextStyle(
                    color: Color.fromRGBO(51, 71, 91, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/SendMsg.svg',
                    color: iconColor,
                    width: 18,
                    height: 18,
                    fit: BoxFit.scaleDown,
                  ),
                  onPressed: () {
                    // if the string contains only white spaces, the message will be considered empty and won't be sent.
                    if (messageEditingController.text.trim() != '') {
                      if (chatController.currentUserID == selectedUserID) {
                        chatController
                            .storeMessageUser(messageEditingController.text);
                      } else {
                        chatController.storeMessageAdmin(
                            selectedUserID, messageEditingController.text);
                      }
                      messageEditingController.clear();
                      print('sending message to Firestore Database ..');
                    } else {
                      print('not sending empty message!!');
                    }
                  },
                ))),
      ),
    );
  }
}
