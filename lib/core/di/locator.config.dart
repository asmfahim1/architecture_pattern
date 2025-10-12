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
import 'package:architecture_pattern/features/dashboard/data/datasource/product_remote_datasource.dart'
    as _i719;
import 'package:architecture_pattern/features/dashboard/data/repositories/product_repo_impl.dart'
    as _i89;
import 'package:architecture_pattern/features/dashboard/domain/repository/product_repo.dart'
    as _i295;
import 'package:architecture_pattern/features/dashboard/domain/usecase/get_product_list_usecase.dart'
    as _i552;
import 'package:architecture_pattern/features/dashboard/domain/usecase/get_total_page_usecase.dart'
    as _i681;
import 'package:architecture_pattern/features/dashboard/presentation/bloc/product_bloc.dart'
    as _i697;
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
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i115.ThemeCubit>(
        () => _i115.ThemeCubit(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i994.ApiClient>(() => _i994.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i313.AuthRemoteDataSource>(
        () => _i313.AuthRemoteDataSourceImpl(gh<_i994.ApiClient>()));
    gh.lazySingleton<_i719.ProductRemoteDataSource>(
        () => _i719.ProductRemoteDataSourceImpl(gh<_i994.ApiClient>()));
    gh.lazySingleton<_i642.NetworkInfo>(() => _i642.NetworkInfoImpl());
    gh.lazySingleton<_i295.ProductRepository>(
        () => _i89.ProductRepositoryImpl(gh<_i719.ProductRemoteDataSource>()));
    gh.lazySingleton<_i104.AuthRepository>(() => _i155.AuthRepositoryImpl(
          remoteDataSource: gh<_i313.AuthRemoteDataSource>(),
          networkInfo: gh<_i642.NetworkInfo>(),
        ));
    gh.lazySingleton<_i552.GetProductsUseCase>(
        () => _i552.GetProductsUseCase(gh<_i295.ProductRepository>()));
    gh.lazySingleton<_i681.GetTotalPagesUseCase>(
        () => _i681.GetTotalPagesUseCase(gh<_i295.ProductRepository>()));
    gh.lazySingleton<_i294.LoginUseCase>(
        () => _i294.LoginUseCase(gh<_i104.AuthRepository>()));
    gh.factory<_i697.ProductBloc>(() => _i697.ProductBloc(
          gh<_i552.GetProductsUseCase>(),
          gh<_i681.GetTotalPagesUseCase>(),
        ));
    gh.factory<_i241.AuthBloc>(
        () => _i241.AuthBloc(loginUseCase: gh<_i294.LoginUseCase>()));
    return this;
  }
}

class _$AppModule extends _i1044.AppModule {}
