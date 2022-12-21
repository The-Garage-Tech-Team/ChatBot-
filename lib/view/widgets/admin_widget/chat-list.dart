import 'package:chatbot_template/logic/controller/chat_controller_1.dart';
import 'package:chatbot_template/logic/controller/dashboard_controller.dart';
import 'package:chatbot_template/view/widgets/admin_widget/newest.dart';
import 'package:chatbot_template/view/widgets/admin_widget/oldest.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);
  final chatController = Get.put(ChatContoller1());
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.only(left: 33),
          width: Get.width * 0.20,
          height: Get.height * 0.75,
          child: Expanded(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  bottom: const TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                      fontFamily: 'Mulish',
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    tabs: [
                      Tab(text: 'Newest'),
                      Tab(text: 'Oldest'),
                    ],
                  ),
                ),
              ),
              body: GetBuilder<DashboardController>(builder: (_) {
                return TabBarView(
                  children: [
                    NewestChat(status: chatController.status),
                    OldestChat(status: chatController.status),
                  ],
                );
              }),
            ),
          ),
        ),
      );
}
