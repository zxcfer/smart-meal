import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_meal/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();
  Future<void> updateUser(UserModel user);
  Future<void> signOut();
  Stream<UserModel?> get userStream;
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl(this._dio);

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await _dio.get('/api/user/current');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get current user');
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      await _dio.put('/api/user/${user.id}', data: user.toJson());
    } catch (e) {
      throw Exception('Failed to update user');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _dio.post('/api/auth/signout');
    } catch (e) {
      throw Exception('Failed to sign out');
    }
  }

  @override
  Stream<UserModel?> get userStream =>
      Stream.value(null); // Implement with real-time updates if needed
}
