import 'package:get/get.dart';

import '../../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  final RxBool isLoading = false.obs;
  final RxString username = ''.obs;
  final RxString password = ''.obs;

  void setUsername(String value) => username.value = value;

  void setPassword(String value) => password.value = value;

  Future<void> login() async {
    try {
      isLoading.value = true;
      final user = await loginUseCase.execute(username.value, password.value);
      print("${user?.username}");
      print("${user?.password}");
      if (user != null) {
        Get.toNamed('/product_list');
      }
      isLoading.value = false;
    } catch (e) {
      // Handle error
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
