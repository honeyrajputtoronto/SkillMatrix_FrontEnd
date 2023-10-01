import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.offAllNamed(Routes.HOME),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Registration'),
        ),
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width < 600 ? Get.width * 0.9 : Get.width / 2,
            child: Form(
              key: controller.formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')),
                    ],
                    decoration: const InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
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
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
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
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
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
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.isLoading.value = false;
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
                      onPressed: () => controller.callRegApi(),
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
                        : const SizedBox(
                      height: 30,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
