import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
        ),
        body: Center(
          child: SizedBox(
            width: Get.width / 2,
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a user name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.userName = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'College Name',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a college name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.collegeName = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'College ID',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a college ID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.collegeId = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      // You can add more complex email validation logic here if needed
                      return null;
                    },
                    onSaved: (value) {
                      controller.email = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.password = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.confirmPassword = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => !controller.isLoading.value
                        ? MaterialButton(
                            onPressed: () => controller.submitForm(),
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 30,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
