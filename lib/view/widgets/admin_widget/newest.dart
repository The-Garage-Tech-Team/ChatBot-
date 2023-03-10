import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:chatbot_template/logic/controller/dashboard_controller.dart';
import 'package:chatbot_template/model/extensions.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_chat_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewestChat extends StatelessWidget {
  final chatController = Get.put(ChatContoller1());
  NewestChat({Key? key, required this.status}) : super(key: key);
  final String status;

  String date = DateTime.now().toString().changeDateFormat();
  final controller = Get.find<DashboardController>();

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection('newChatbot').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: SizedBox(
                    height: 15.0,
                    width: 15.0,
                    child: Transform.scale(
                      scale: 2,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  // shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data!.docs[index]['status'] ==
                            'isOpened' ||
                        snapshot.data!.docs[index]['status'] == 'onHold') {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.selectedUserID =
                                  snapshot.data!.docs[index].id;
                              chatController
                                  .getStatus(snapshot.data!.docs[index].id);
                              // controller.test(snapshot, index);
                              db
                                  .collection('newChatbot')
                                  .doc(snapshot.data!.docs[index].id)
                                  .update({'status': 'isOpened'});
                              controller.isPressedFun();
                              // Get.to(() => AdminChatWidget(selectedUserID:  controller.selectedUserID,
                              //     docID: snapshot.data!.docs[index].id));
                            },
                            child: Card(
                                color: Colors.white,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(
                                              159, 162, 180, 0.08),
                                          border: Border(
                                            left: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 0, 0, 0),
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5),
                                          child: ListTile(
                                            title: Text(
                                              snapshot.data!.docs[index]
                                                  .data()['user_email']
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontFamily: 'Mulish',
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.none,
                                              ),
                                            ),
                                            minLeadingWidth: 11.37,
                                            subtitle: Text(controller
                                                .timestampToDesiredFormat(
                                                    snapshot.data!
                                                            .docs[index]
                                                            .data()[
                                                        'last_message_time'])),
                                            leading: const Icon(Icons.face),
                                            trailing: const Text(""),
                                            // Badge(
                                            //   elevation: 0,
                                            //   shape: BadgeShape.circle,
                                            //   padding: EdgeInsets.all(7),
                                            //   badgeContent: const Text(
                                            //     "0",
                                            //     style: TextStyle(color: Colors.white),
                                            //   ),
                                            // ),
                                          ),
                                      ),
                                    ),
                                  ),
                             ],
                                ),

                            )),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  });
        });
  }
}
