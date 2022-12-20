import 'package:chatbot_template/constants/constants.dart';
import 'package:chatbot_template/view/screens/bottom_bar_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../model/user_model.dart';
import '../../view/screens/dashborad_screen.dart';

class LoginController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var displayName = '';
  var loggedIn = false;
  final GetStorage authBox = GetStorage();
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  var loggedIn = false;
  final Rx<UserModel> _userModel =
      UserModel(email: '', uid: '', password: '').obs;
  UserModel get user => _userModel.value;
  User? get userProfile => _firebaseAuth.currentUser;
  set user(UserModel value) => _userModel.value = value;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  void signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('success', 'success',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kBlackColor,
          colorText: kBackgroundColor);

      loggedIn = true;
      authBox.write('auth', loggedIn);
      // This solves the error: navigation to screens must be after authentication (sign-in)
      if (email == 'admin@gmail.com' && password == 'admin123') {
        Get.to(() => DashboardScreen());
      } else {
        Get.to(() => BottomBarScreen());
      }

      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kBlackColor,
          colorText: kBackgroundColor);
    } catch (e) {
      Get.snackbar(
        'Error occured!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kBlackColor,
        colorText: kBackgroundColor,
      );
    }
  }

  void signUpUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserEmail.value = email;
        displayUserEmail.value = email;
      });

      DocumentReference doc =
          FirebaseFirestore.instance.collection("users").doc(email);

      doc.set({
        "email": email,
        "password": password,
      });

      update();
      if (email == 'admin@gmail.com' && password == 'admin123') {
        Get.to(() => DashboardScreen());
      } else {
        Get.to(() => BottomBarScreen());
      }
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'email-already-in-use') {
        message = 'Email already used';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
      );
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
    loggedIn = false;
    authBox.remove('auth');
    update();
  }
}
