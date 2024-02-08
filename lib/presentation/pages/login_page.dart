import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/login_controller.dart';

import '../../resource/strings_manager.dart';
import '../common_component/common_editext_view.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _nameField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton(
              onPressed: () => loginController.login(),
              child: loginController.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            )),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return Obx(() => TextInputField(
      isPasswordField: false,
      errorText: loginController.errorName.value,
      hintText: StringManager.name,
      textInputType: TextInputType.text,
      onChanged: (val)=>loginController.setUsername(val!),
    )) ;
  }

  Widget _passwordField() {
    return Obx(() => TextInputField(
      errorText: loginController.errorPassword.value,
      hintText: StringManager.password,
      textInputType: TextInputType.text,
      isPasswordField: true,
      onChanged: (val)=>loginController.setPassword(val!),
    ));
  }
}
