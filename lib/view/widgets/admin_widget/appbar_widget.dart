import 'package:chatbot_template/uitls/text_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../logic/controller/dashboard_controller.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 33.0, bottom: 33),
      child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('newChatbot').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            if (snapshot.hasData) {
              controller.checkStatus(snapshot.data!.docs);
              return Obx(() {
                return Row(
                  children: [
                    SizedBox(
                      height: Get.height * 0.15,
                      width: Get.width * 0.50,
                      child: Card(
                        child: IntrinsicHeight(
                          // ignore: unnecessary_new
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CasesItems(
                                  total: controller.isOpened.value,
                                  title: controller.casesItem[0]),
                              const VerticalDivider(
                                color: Colors.black,
                                endIndent: 10,
                                indent: 10,
                              ),
                              CasesItems(
                                  total: controller.isClose.value,
                                  title: controller.casesItem[1]),
                              const VerticalDivider(
                                color: Colors.black,
                                endIndent: 10,
                                indent: 10,
                              ),
                              CasesItems(
                                  total: controller.onHold.value,
                                  title: controller.casesItem[2]),
                              const VerticalDivider(
                                color: Colors.black,
                                endIndent: 10,
                                indent: 10,
                              ),
                              CasesItems(
                                  total: snapshot.data!.docs.length,
                                  title: controller.casesItem[3]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
            }
            return CircularProgressIndicator();
          }),
    );
  }

  Column CasesItems({
    required int total,
    required String title,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextUtils(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          text: total.toString(),
        ),
        TextUtils(
          color: controller.getColor(title),
          fontSize: 16,
          fontWeight: FontWeight.normal,
          text: title,
        ),
      ],
    );
  }
}
