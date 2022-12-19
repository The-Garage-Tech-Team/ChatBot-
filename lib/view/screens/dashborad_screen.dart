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
    print(' testing : ' + controller.selectedUserID);
    return Scaffold(
      body: Stack(
        children: [
          // Center(child: SizedBox(
          //     height: 15.0,
          //     width: 15.0,
          //     child: Transform.scale(
          //       scale: 2,
          //       child: const CircularProgressIndicator(
          //         strokeWidth: 2,
          //         valueColor: AlwaysStoppedAnimation<Color>(
          //           Colors.grey
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideBarWidget(),
                AppBarWidget(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatList(),
              GetBuilder<DashboardController>(builder: (_) {
                print(controller.isPressed);
                return controller.isPressed
                    ? AdminChatWidget(
                        selectedUserID: controller.selectedUserID,
                        docID: controller.selectedUserID)
                    : Container();
              }),

              // AdminChatWidget(
              //     selectedUserID: controller.selectedUserID,
              //     docID: controller.selectedUserID),
              UserProfile(),
            ],
          ),
        ],
      ),
    );
  }
}
