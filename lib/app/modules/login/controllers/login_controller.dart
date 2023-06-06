import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      login();
    }
  }

  login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      // print('User logged in: ${user?.email}');
      Get.toNamed(Routes.DASHBOARD);
    } on FirebaseAuthException catch (e) {
      String msg = "";
      if (e.code == 'user-not-found') {
        msg = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Invalid password.';
      } else {
        msg = e.message ?? "";
      }
      Get.showSnackbar(GetSnackBar(
        title: "Login failed",
        message: msg,
        duration: const Duration(seconds: 1),
      ));
    }
  }
}
