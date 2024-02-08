import 'package:get/get.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../resource/strings_manager.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  final RxBool isLoading = false.obs;
  final RxString username = ''.obs;
  final RxString password = ''.obs;

  void setUsername(String value) => username.value = value;

  void setPassword(String value) => password.value = value;

  RxString errorPassword=''.obs;
  RxString errorName=''.obs;

  void setErrorUsername(String value) => errorName.value = value;
  void setErrorPassword(String value) => errorPassword.value = value;

  Future<void> login() async {
    try {
      if(username.value.isEmpty){
        setErrorUsername(StringManager.enterName);
      }else if(password.value.isEmpty){
        setErrorUsername('');
        setErrorPassword(StringManager.enterPassword);
      }else{
        setErrorUsername('');
        setErrorPassword('');
        isLoading.value = true;
        final user = await loginUseCase.execute(username.value, password.value);
        if (user != null) {
          Get.toNamed('/product_list');
        }

        isLoading.value = false;
      }

    } catch (e) {
      // Handle error
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
