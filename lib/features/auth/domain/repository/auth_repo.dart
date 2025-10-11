import 'package:architecture_pattern/core/network/api_response.dart';
import 'package:architecture_pattern/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> login(UserEntity user);
}