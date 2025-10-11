abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

// Common additional events you might want:
class LogoutRequested extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}