import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/register_controller.dart';

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
            TextFormField(
              onChanged: registerController.setUsername,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: registerController.setPassword,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
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
}
