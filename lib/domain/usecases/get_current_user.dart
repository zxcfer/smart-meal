import 'package:injectable/injectable.dart';
import 'package:smart_meal/domain/entities/user.dart';
import 'package:smart_meal/domain/repositories/user_repository.dart';

@injectable
class GetCurrentUser {
  final UserRepository _userRepository;

  GetCurrentUser(this._userRepository);

  Future<User> call() async {
    return await _userRepository.getCurrentUser();
  }
}
