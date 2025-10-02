// presentation/redux/reducers/auth_reducer.dart
import 'package:architecture_pattern/presentation/redux/actions/auth_actions.dart';
import 'package:architecture_pattern/presentation/redux/auth_state.dart';

AuthState authReducer(AuthState state, dynamic action) {
  if (action is LoginAction) {
    return state.copyWith(isLoading: true, error: null);
  } else if (action is LoginSuccessAction) {
    return state.copyWith(
      isLoading: false,
      isAuthenticated: true,
      token: action.token,
      user: action.user,
      error: null,
    );
  } else if (action is LoginFailureAction) {
    return state.copyWith(
      isLoading: false,
      isAuthenticated: false,
      error: action.error,
    );
  } else if (action is LogoutAction) {
    return AuthState.initial();
  }
  return state;
}
