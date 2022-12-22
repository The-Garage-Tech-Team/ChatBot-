import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 58,
        height: 23,
        margin: EdgeInsets.only(right: 24, top: 9, bottom: 9, left: 290),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/check.svg",
                width: 14,
                color: Colors.white,
              ),
              Text(
                "Closed",
                style: TextStyle(
                    fontSize: 8, color: Colors.white, fontFamily: "Mulish"),
              ),
            ],
          ),
        ));
  }
}
