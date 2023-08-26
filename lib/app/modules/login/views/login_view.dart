import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import '../../../routes/app_pages.dart';
import '../../../../app_data.dart';
import '../controllers/login_controller.dart';



class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Login'),
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
                        hintText: 'Username',
                        hintStyle: Theme.of(context).textTheme.bodySmall),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an Username';
                      }
                      // You can add more complex email validation logic here if needed
                      return null;
                    },
                    onSaved: (value) async {
                      username = value!;
                      controller.username = value;
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('username_value',value);
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
                  const SizedBox(height: 16),
                  MaterialButton(
                    onPressed: () => controller.submitForm(),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
