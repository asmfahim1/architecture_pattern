import 'package:architecture_pattern/core/errors/exceptions.dart';
import 'package:architecture_pattern/core/network/api_client.dart';
import 'package:architecture_pattern/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}


@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;
  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> login(String email, String password) async {
    final resp = await client.post(
      'https://reqres.in/api/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    if (resp.statusCode == 200) {
      final token = resp.data['token'] as String?;
      if (token != null) return UserModel(token: token, email: email);
      throw ServerException('Invalid response');
    } else {
      throw ServerException('Login failed: ${resp.statusCode}');
    }
  }
}