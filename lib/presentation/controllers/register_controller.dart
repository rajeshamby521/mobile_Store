import 'package:get/get.dart';
import '../../data/models/user.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;

  RegisterController(this.registerUseCase);

  final RxBool isLoading = false.obs;
  final RxString username = ''.obs;
  final RxString password = ''.obs;

  void setUsername(String value) => username.value = value;

  void setPassword(String value) => password.value = value;

  Future<void> register() async {
    try {
      isLoading.value = true;
      final user = User(
        username: username.value,
        password: password.value, id: 0,
      );
      await registerUseCase.execute(user);
      // Registration success
      isLoading.value = false;
    } catch (e) {
      // Handle error
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}