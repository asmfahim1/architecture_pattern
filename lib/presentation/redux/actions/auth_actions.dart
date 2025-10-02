// presentation/redux/actions/auth_actions.dart
import 'package:architecture_pattern/data/models/user_model.dart';

class LoginAction {
  final String email;
  final String password;

  LoginAction(this.email, this.password);
}

class LoginSuccessAction {
  final String token;
  final UserModel user;

  LoginSuccessAction(this.token, this.user);
}

class LoginFailureAction {
  final String error;

  LoginFailureAction(this.error);
}

class LogoutAction {}

class RegisterAction {
  final String name;
  final String email;
  final String password;

  RegisterAction(this.name, this.email, this.password);
}