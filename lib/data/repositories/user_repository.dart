import '../models/user.dart';

abstract class UserRepository {
  Future<void> registerUser(User user);
  Future<User?> loginUser(String username, String password);
}