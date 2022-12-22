import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/mark_close_button.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../logic/controller/dashboard_controller.dart';

class AdminChatWidget extends StatelessWidget {
  final String docID;
  final chatController = Get.put(ChatContoller1());
  final String selectedUserID;
  //var userUid = FirebaseAuth.instance.currentUser!.uid;

  AdminChatWidget(
      {super.key,
      required this.docID,
      required this.selectedUserID,
      required this.status});
   String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width * 0.35,
      height: Get.height * 0.75,
      margin: EdgeInsets.only(right: 20, bottom: 15),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(54, 55, 64, 1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(3), bottomRight:Radius.circular(3) )
          ),
          alignment: Alignment.centerRight,
          // height: 40,
          child:  MarkClosedButton(selectedUserID: selectedUserID),),

            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: chatController.getMessageByStream(docID),
                    builder: (context, snapshot) {
                      List<Widget> chatMessages = [];
                      if (!snapshot.hasData) {
                        return Center(
                            child: SizedBox(
                          //height: 15.0,
                          //width: 15.0,
                          child: Transform.scale(
                            scale: 2,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        ));
                      } else if (snapshot.hasData) {
                        if (snapshot.data!.docs.length < 1) {
                          return Container(
                            decoration: BoxDecoration(color: Colors.white),
                            // width:  1200,
                            //height: 980,
                          );
                        }
                        return ListView.builder(
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {

                          status = snapshot.data!.docs[index]['senderID'];
                          final msgWidget = chatController.isCurrentUser(
                                  snapshot.data!.docs[index]['senderID'])
                              ? UserResponse(
                                  text: snapshot.data!.docs[index]['message'],
                                  timeSent:
                                      chatController.timestampToDesiredFormat(
                                          snapshot.data!.docs[index]['time']),
                                  widgetColor:
                                      const Color.fromRGBO(54, 55, 64, 1),
                                )
                              : AdminResponse(
                                  text: snapshot.data!.docs[index]['message'],
                                  timeSent:
                                      chatController.timestampToDesiredFormat(
                                          snapshot.data!.docs[index]['time']),
                                );
                          chatMessages.add(msgWidget);
                          return msgWidget;
                          },
                        );
                      }
                      return Container();
                    })),
            InputMsg(
              selectedUserID: selectedUserID,
            )
          ]),
    );
  }
}
