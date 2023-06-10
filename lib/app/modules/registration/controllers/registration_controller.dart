import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String userName = '';
  String collegeName = '';
  String collegeId = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  RxBool isLoading = false.obs;

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

  void submitForm() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (await isEmailAlreadyExists(email)) {
        Get.showSnackbar(const GetSnackBar(
          title: "User already exists",
          message: "User with same email id exits",
        ));
        isLoading.value = false;
        return;
      }
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var db = FirebaseFirestore.instance;
      final user = <String, dynamic>{
        "userName": userName,
        "collegeName": collegeName,
        "collegeId": collegeId,
        "email": email,
        'uid': userCredential.user?.uid
      };

      db.collection("users").add(user).then((DocumentReference doc) =>
          print('DocumentSnapshot added with ID: ${doc.id}'));
      isLoading.value = false;
      Get.toNamed(Routes.LOGIN);
    }
  }

  Future<bool> isEmailAlreadyExists(String email) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return snapshot.docs.isEmpty;
  }
}
