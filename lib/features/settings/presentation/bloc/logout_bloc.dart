import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class LogoutEvent {}
class PerformLogout extends LogoutEvent {}

abstract class LogoutState {}
class LogoutInitial extends LogoutState {}
class LogoutLoading extends LogoutState {}
class LogoutSuccess extends LogoutState {}
class LogoutFailure extends LogoutState {}

@injectable
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<PerformLogout>((event, emit) async {
      emit(LogoutLoading());
      await Future.delayed(const Duration(seconds: 1)); // Dummy API call
      emit(LogoutSuccess());
    });
  }
}