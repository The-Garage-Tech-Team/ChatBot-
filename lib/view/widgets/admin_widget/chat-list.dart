import 'package:chatbot_template/view/widgets/admin_widget/newest.dart';
import 'package:chatbot_template/view/widgets/admin_widget/oldest.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: SizedBox(
          width: Get.width-1000,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 284, top: 246, right: 0, bottom: 17),
              child: Card(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: AppBar(
                      backgroundColor: Colors.white,
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
                  body: TabBarView(
                    children: [
                      NewestChat(status:false),
                      OldestChat(status:true),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
