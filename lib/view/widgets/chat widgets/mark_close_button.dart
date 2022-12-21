import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/close_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MarkClosedButton extends StatelessWidget {
  final chatController = Get.find<ChatContoller1>();
  MarkClosedButton({super.key, required this.selectedUserID});
  final db = FirebaseFirestore.instance;
  final String selectedUserID;
  String status = '';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatContoller1>(builder: (_) {
      return chatController.status != 'isClose'
          ? Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 9, bottom: 9),
              child: ElevatedButton(
                onPressed: () async {
                  db
                      .collection('newChatbot')
                      .doc(selectedUserID)
                      .update({'status': 'isClose'});

                  chatController.status =
                      await chatController.getStatus(selectedUserID);
                  print(status);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/checkMarkIcon.svg',
                      width: 14,
                      height: 14,
                      fit: BoxFit.scaleDown,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Text(
                        'Mark as close',
                        style: TextStyle(
                          fontSize: 8,
                          color: Color.fromRGBO(54, 55, 64, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : CloseButtonWidget();
    });
  }
}
