import 'package:architecture_pattern/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String token;
  final String email;
  UserModel({required this.token, required this.email});

  UserEntity toEntity() => UserEntity(token: token, email: email);
}