import 'package:get/get.dart';
import '../../data/models/user.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../resource/strings_manager.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;

  RegisterController(this.registerUseCase);

  final RxBool isLoading = false.obs;
  final RxString username = ''.obs;
  final RxString password = ''.obs;
  final RxString email = ''.obs;
  final RxString confirmPassword = ''.obs;

  void setUsername(String value) => username.value = value;
  void setPassword(String value) => password.value = value;
  void setEmail(String value) => email.value = value;
  void setConfirmPassword(String value) => confirmPassword.value = value;

  void setErrorUsername(String value) => errorName.value = value;
  void setErrorPassword(String value) => errorPassword.value = value;
  void setErrorEmail(String value) => errorEmail.value = value;
  void setErrorConfirmPassword(String value) => errorConformPassword.value = value;

  RxString errorEmail=''.obs;
  RxString errorPassword=''.obs;
  RxString errorName=''.obs;
  RxString errorConformPassword=''.obs;

  Future<void> register() async {
    try {
      if(username.value.isEmpty){
        setErrorUsername(StringManager.enterName);
      }else if(email.value.isEmpty){
        setErrorUsername('');
        setErrorEmail(StringManager.enterEmail);
      }else if(!validateEmailAddress(email.value)){
        setErrorUsername('');
        setErrorEmail(StringManager.enterValidEmailAddress);
      }else if(password.value.isEmpty){
        setErrorUsername('');
        setErrorEmail('');
        setErrorPassword(StringManager.enterPassword);
      }else if(confirmPassword.value.isEmpty){
        setErrorUsername('');
        setErrorEmail('');
        setErrorPassword('');
        setErrorConfirmPassword(StringManager.enterConfirmPassword);
      }else if(confirmPassword.value != password.value){
        setErrorUsername('');
        setErrorEmail('');
        setErrorPassword('');
        setErrorConfirmPassword(StringManager.passwordNotMatch);
      }else{
        setErrorUsername('');
        setErrorEmail('');
        setErrorPassword('');
        setErrorConfirmPassword('');
        isLoading.value = true;
        final user = User(
          username: username.value,
          password: password.value,
          email: email.value,
          confirmPassword: confirmPassword.value,
        );
        await registerUseCase.execute(user);
        // Registration success
        isLoading.value = false;
        Get.back();
      }

    } catch (e) {
      // Handle error
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}

bool validateEmailAddress(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}