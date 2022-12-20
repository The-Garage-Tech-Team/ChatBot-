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
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width * 0.40,
      height: Get.height * 0.75,
      constraints: const BoxConstraints(
        maxHeight: 1200,
        maxWidth: 900,
      ),
      child: Material(
        color: Colors.white,
        child: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            color: const Color.fromRGBO(54, 55, 64, 1),
            // height: 40,
            child:  MarkClosedButton(selectedUserID: selectedUserID),
          ),
          // child: chatController.status ? Container(
          //       width: 120,
          //       margin: EdgeInsets.only(right: 24, top: 9, bottom: 9),
          //       decoration: BoxDecoration(border:  Border.all(
          //         color: Colors.white,
          //         width: 1,
          //       ),    borderRadius: BorderRadius.circular(4),
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: SvgPicture.asset("assets/icons/check.svg", width: 20,color: Colors.white,),
          //             ),
          //             Text("Closed", style: TextStyle(fontSize:14,color: Colors.white, fontFamily: "Mulish" ),
          //             ),
          //           ],
          //         ),
          //       )):
          // ),
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
      ),
    );
  }
}
