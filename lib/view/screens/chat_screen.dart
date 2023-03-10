import 'package:chatbot_template/utils/constants.dart';
import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_response.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/input_send_msg.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/user_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {

  final chatController = Get.put(ChatContoller1());
  var userUid = FirebaseAuth.instance.currentUser!.uid;
  final String selectedUserID;

  ChatScreen({super.key, required this.selectedUserID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Virtual Assistant',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: kBlackColor),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: kBlackColor,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: chatController
                    .getMessageByStream(chatController.currentUserID),
                builder: (context, snapshot) {
                  List<Widget> chatMessages = [];
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        height: 15.0,
                        width: 15.0,
                        child: Transform.scale(
                          scale: 2,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length < 1) {
                      return Container();
                    }

                    return ListView.builder(
                      reverse: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final msgWidget = chatController.isCurrentUser(
                                snapshot.data!.docs[index]['senderID'])
                            ? UserResponse(
                                text: snapshot.data!.docs[index]['message'],
                                timeSent:
                                    chatController.timestampToDesiredFormat(
                                        snapshot.data!.docs[index]['time']),
                                widgetColor:
                                    const Color.fromRGBO(0, 140, 180, 1),
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
            selectedUserID: chatController.currentUserID,
            iconColor: const Color.fromRGBO(0, 140, 180, 1))
      ]),
    );
  }
}
