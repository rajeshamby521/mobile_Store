
import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class RegisterUseCase {
  final UserRepository userRepository;

  RegisterUseCase(this.userRepository);

  Future<void> execute(User user) async {
    await userRepository.registerUser(user);
  }
}