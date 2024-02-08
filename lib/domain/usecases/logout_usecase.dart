

import 'package:mobile_store/data/repositories/user_repository.dart';


class LogoutUseCase {
  final UserRepository userRepository;

  LogoutUseCase(this.userRepository);

  Future<void> execute() async {
    return await userRepository.logout();
  }
}
