// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:architecture_pattern/core/di/app_module.dart' as _i1044;
import 'package:architecture_pattern/core/network/api_client.dart' as _i994;
import 'package:architecture_pattern/core/network/network_info.dart' as _i642;
import 'package:architecture_pattern/core/theme/theme_manager.dart' as _i115;
import 'package:architecture_pattern/features/auth/data/data_source/auth_remote_data_source.dart'
    as _i313;
import 'package:architecture_pattern/features/auth/data/repository/auth_repo_impl.dart'
    as _i155;
import 'package:architecture_pattern/features/auth/domain/repository/auth_repo.dart'
    as _i104;
import 'package:architecture_pattern/features/auth/domain/usecases/login_usecase.dart'
    as _i294;
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_bloc.dart'
    as _i241;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i642.NetworkInfoImpl>(() => _i642.NetworkInfoImpl());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i115.ThemeCubit>(
        () => _i115.ThemeCubit(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i994.ApiClient>(() => _i994.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i313.AuthRemoteDataSource>(
        () => _i313.AuthRemoteDataSourceImpl(gh<_i994.ApiClient>()));
    gh.lazySingleton<_i104.AuthRepository>(() => _i155.AuthRepositoryImpl(
          remoteDataSource: gh<_i313.AuthRemoteDataSource>(),
          networkInfo: gh<_i642.NetworkInfo>(),
        ));
    gh.factory<_i294.LoginUseCase>(
        () => _i294.LoginUseCase(gh<_i104.AuthRepository>()));
    gh.factory<_i241.AuthBloc>(
        () => _i241.AuthBloc(loginUseCase: gh<_i294.LoginUseCase>()));
    return this;
  }
}

class _$AppModule extends _i1044.AppModule {}
