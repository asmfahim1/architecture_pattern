import 'package:architecture_pattern/core/network/api_response.dart';
import 'package:architecture_pattern/features/auth/domain/entities/user_entity.dart';
import 'package:architecture_pattern/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);


  Future<Result<UserEntity>> call(UserEntity user) {
    return repository.login(user);
  }
}