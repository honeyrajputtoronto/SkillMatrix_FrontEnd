import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';



  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://127.0.0.1:8002/login/'));
      request.fields.addAll({'username': '$email', 'password': '$password'});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
      } else {
      }
    }
  }

  // login() async {
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     User? user = userCredential.user;
  //     // print('User logged in: ${user?.email}');
  //     Get.toNamed(Routes.DASHBOARD);
  //   } on FirebaseAuthException catch (e) {
  //     String msg = "";
  //     if (e.code == 'user-not-found') {
  //       msg = 'No user found with this email.';
  //     } else if (e.code == 'wrong-password') {
  //       msg = 'Invalid password.';
  //     } else {
  //       msg = e.message ?? "";
  //     }
  //     Get.showSnackbar(GetSnackBar(
  //       title: "Login failed",
  //       message: msg,
  //       duration: const Duration(seconds: 1),
  //     ));
  //   }
  // }
}
