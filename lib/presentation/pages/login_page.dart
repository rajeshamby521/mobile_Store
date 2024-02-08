import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/login_controller.dart';

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
            TextFormField(
              onChanged: loginController.setUsername,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: loginController.setPassword,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
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
}
