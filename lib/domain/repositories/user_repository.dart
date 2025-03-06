import 'package:smart_meal/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<void> updateUser(User user);
  Future<void> signOut();
  Stream<User?> get userStream;
}
