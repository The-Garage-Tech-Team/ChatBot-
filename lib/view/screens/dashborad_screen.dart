import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:chatbot_template/logic/controller/dashboard_controller.dart';
import 'package:chatbot_template/view/widgets/admin_widget/appbar_widget.dart';
import 'package:chatbot_template/view/widgets/admin_widget/chat-list.dart';
import 'package:chatbot_template/view/widgets/admin_widget/side_bar_widget.dart';
import 'package:chatbot_template/view/widgets/admin_widget/user-profile.dart';
import 'package:chatbot_template/view/widgets/chat%20widgets/admin_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DashboardScreen extends StatelessWidget {
  final chatController = Get.put(ChatContoller1());
  DashboardScreen({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Row(
        children: [
        SideBarWidget(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 33.0, top: 26, bottom: 26),
              child: Text("Overview", style: TextStyle(fontFamily: "Mulish", fontSize: 24),),
            ),
            AppBarWidget(),
            Expanded(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChatList(),
                  GetBuilder<DashboardController>(builder: (_) {
                    return controller.isPressed
                        ? AdminChatWidget(
                        status: chatController.status.toString(),
                        selectedUserID: controller.selectedUserID,
                        docID: controller.selectedUserID)
                        : Container();
                  }),
                  Get.width < 1000 ? Text(""):
                  UserProfile(),
                ],
              ),
            ),
          ],
        ),

      ],),
    );
  }
}
