import 'package:architecture_pattern/features/auth/domain/entities/user_entity.dart';
import 'package:architecture_pattern/features/auth/domain/usecases/login_usecase.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_event.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    // Create UserEntity with email and password for login
    final loginUser = UserEntity(
      token: '',
      email: event.email,
      password: event.password,
    );

    final result = await loginUseCase(loginUser);

    if (result.isSuccess) {
      emit(AuthAuthenticated(result.data!));
    } else {
      emit(AuthError(result.failure!.message));
    }
  }
}