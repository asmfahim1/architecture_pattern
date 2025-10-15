import 'package:architecture_pattern/core/di/locator.dart';
import 'package:architecture_pattern/core/errors/failures.dart';
import 'package:architecture_pattern/core/network/api_response.dart';
import 'package:architecture_pattern/core/network/network_info.dart';
import 'package:architecture_pattern/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:architecture_pattern/features/auth/domain/entities/user_entity.dart';
import 'package:architecture_pattern/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:architecture_pattern/core/storae/session_manager.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  final SessionManager _sessionManager = getIt<SessionManager>();

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Result<UserEntity>> login(UserEntity user) async {
    if (!await networkInfo.isConnected) {
      return Result.failure(NetworkFailure('No internet connection'));
    }
    try {
      final response = await remoteDataSource.login(user.email, user.password ?? "");

      // Save token to session manager
      await _sessionManager.saveAuthToken(response.token);

      return Result.success(response.toEntity());
    } catch (e) {
      return Result.failure(ServerFailure(e.toString()));
    }
  }
}