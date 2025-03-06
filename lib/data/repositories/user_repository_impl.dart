import 'package:injectable/injectable.dart';
import 'package:smart_meal/data/datasources/user_remote_data_source.dart';
import 'package:smart_meal/domain/entities/user.dart';
import 'package:smart_meal/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<User> getCurrentUser() async {
    final userModel = await _remoteDataSource.getCurrentUser();
    return User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      photoUrl: userModel.photoUrl,
      createdAt: userModel.createdAt,
    );
  }

  @override
  Future<void> updateUser(User user) async {
    // Implementation
  }

  @override
  Future<void> signOut() async {
    // Implementation
  }

  @override
  Stream<User?> get userStream => _remoteDataSource.userStream.map((userModel) {
        if (userModel == null) return null;
        return User(
          id: userModel.id,
          name: userModel.name,
          email: userModel.email,
          photoUrl: userModel.photoUrl,
          createdAt: userModel.createdAt,
        );
      });
}
