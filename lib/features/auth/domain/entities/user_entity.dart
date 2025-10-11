class UserEntity {
  final String token;
  final String email;
  final String? password;

  UserEntity({required this.token, required this.email, this.password});

  Map<String, dynamic> toLoginJson() => {
    'email': email,
    'password': password,
  };
}