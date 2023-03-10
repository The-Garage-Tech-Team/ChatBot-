import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      width: Get.width * 0.20,
      height: Get.height * 0.75,
      margin: EdgeInsets.only(bottom: 15),
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/personal_picture2.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Haneen",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "@Haneen",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mulish',
                      color: Colors.grey.shade400,
                      decoration: TextDecoration.none,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Phone',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '+966531394554',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.grey.shade400,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'memay20@gmail.com',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.grey.shade400,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Date of birth',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '16 march 2003',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.grey.shade400,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Female',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Mulish',
                  color: Colors.grey.shade400,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shared file',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Mulish',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Mulish',
                      color: Colors.grey.shade400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
