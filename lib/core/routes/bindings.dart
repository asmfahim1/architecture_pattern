// core/di/app_providers.dart
import 'package:architecture_pattern/features/dashboard/presentation/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:architecture_pattern/core/theme/theme_manager.dart';
import 'package:architecture_pattern/core/di/locator.dart' as di;

class AppProviders {
  static List<BlocProvider> get blocProviders => [
    BlocProvider<ThemeCubit>(
      create: (_) => di.sl<ThemeCubit>(),
    ),
    BlocProvider<AuthBloc>(
      create: (_) => di.sl<AuthBloc>(),
    ),
    BlocProvider<ProductBloc>(
      create: (_) => di.sl<ProductBloc>(),
    ),
    // Add more bloc providers here
  ];
}