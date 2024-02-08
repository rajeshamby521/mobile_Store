import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<User?> execute(String username, String password) async {
    return await userRepository.loginUser(username, password);
  }
}