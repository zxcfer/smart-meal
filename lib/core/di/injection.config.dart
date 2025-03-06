// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:smart_meal/core/di/injection.dart' as _i985;
import 'package:smart_meal/data/datasources/user_remote_data_source.dart'
    as _i394;
import 'package:smart_meal/data/repositories/user_repository_impl.dart'
    as _i392;
import 'package:smart_meal/domain/repositories/user_repository.dart' as _i953;
import 'package:smart_meal/domain/usecases/get_current_user.dart' as _i816;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i394.UserRemoteDataSource>(
        () => _i394.UserRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i953.UserRepository>(
        () => _i392.UserRepositoryImpl(gh<_i394.UserRemoteDataSource>()));
    gh.factory<_i816.GetCurrentUser>(
        () => _i816.GetCurrentUser(gh<_i953.UserRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i985.RegisterModule {}
