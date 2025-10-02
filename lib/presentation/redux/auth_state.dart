// Auth State
import 'package:architecture_pattern/data/models/user_model.dart';

class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? token;
  final UserModel? user;
  final String? error;

  AuthState({
    required this.isLoading,
    required this.isAuthenticated,
    this.token,
    this.user,
    this.error,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      isAuthenticated: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? token,
    UserModel? user,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      user: user ?? this.user,
      error: error,
    );
  }
}
