import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/register_controller.dart';

import '../../resource/strings_manager.dart';
import '../common_component/common_editext_view.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 10),
            // Enter name text field...
            _nameField(),
            const SizedBox(height: 10),
            // Enter email text field...
            _emailField(),
            const SizedBox(height: 10),
            // Enter password text field...
            _passwordField(),
            const SizedBox(height: 10),
            // Enter re type password...
            _confirmPasswordField(),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton(
              onPressed: () => registerController.register(),
              child: registerController.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            )),
          ],
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return  Obx(() => TextInputField(
      errorText: registerController.errorConformPassword.value,
      hintText: StringManager.confirmPsw,
      textInputType: TextInputType.text,
      isPasswordField: true,
      onChanged: (val)=>registerController.setConfirmPassword(val!),
    )) ;
  }

  Widget _passwordField() {
    return Obx(() => TextInputField(
      errorText: registerController.errorPassword.value,
      hintText: StringManager.password,
      isPasswordField: true,
      textInputType: TextInputType.text,
      onChanged: (val)=>registerController.setPassword(val!),
    ));
  }

  Widget _emailField() {
    return Obx(() => TextInputField(
      isPasswordField: false,
      errorText: registerController.errorEmail.value,
      hintText: StringManager.emailAddress,
      textInputType: TextInputType.emailAddress,
      onChanged: (val)=>registerController.setEmail(val!),
    ));
  }

  Widget _nameField() {
    return Obx(() => TextInputField(
      isPasswordField: false,
      errorText: registerController.errorName.value,
      hintText: StringManager.name,
      textInputType: TextInputType.text,
      onChanged: (val)=>registerController.setUsername(val!),
    )) ;
  }
}
