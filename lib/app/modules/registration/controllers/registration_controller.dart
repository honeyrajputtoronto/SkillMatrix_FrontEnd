import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String userName = '';
  String collegeName = '';
  String collegeId = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

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
      // Perform registration logic or API call here
      // You can access the form values with the variables:
      // _userName, _collegeName, _collegeId, _email, _password, _confirmPassword
    }
  }
}
