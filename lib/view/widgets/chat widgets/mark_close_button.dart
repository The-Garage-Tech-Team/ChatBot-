import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MarkClosedButton extends StatelessWidget {
  final chatController = Get.find<ChatContoller1>();
  MarkClosedButton({super.key, required this.selectedUserID});
  final db = FirebaseFirestore.instance;
  final String selectedUserID;
  var status = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 9, bottom: 9),
      child: ElevatedButton(
        onPressed: () async {
          chatController.updateStatus();

          db
              .collection('newChatbot')
              .doc(selectedUserID)
              .update({'status': 'isClose'});
          print("_________________________");
          print(chatController.getStatus(selectedUserID));
          print("_________________________");
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/checkMarkIcon.svg',
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
    );
    return getStatus() == 'isClose' ? Text("close") : Text(status);
    return chatController.getStatus(selectedUserID).toString() == 'isClose'
        ? Container(
            width: 120,
            margin: EdgeInsets.only(right: 24, top: 9, bottom: 9),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/icons/check.svg",
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Closed",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "Mulish"),
                  ),
                ],
              ),
            ))
        : Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 9, bottom: 9),
            child: ElevatedButton(
              onPressed: () async {
                chatController.updateStatus();

                db
                    .collection('newChatbot')
                    .doc(selectedUserID)
                    .update({'status': 'isClose'});
                print("_________________________");
                print(chatController.getStatus(selectedUserID));
                print("_________________________");
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
                    'assets/images/checkMarkIcon.svg',
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
          );
  }

  String getStatus() {
    return status = chatController.getStatus(selectedUserID).toString();
  }
}
