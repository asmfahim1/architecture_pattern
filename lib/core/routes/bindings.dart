// core/di/app_providers.dart
import 'package:architecture_pattern/core/localization/language_manager.dart';
import 'package:architecture_pattern/features/dashboard/presentation/bloc/product_bloc.dart';
import 'package:architecture_pattern/features/settings/presentation/bloc/logout_bloc.dart';
import 'package:architecture_pattern/features/settings/presentation/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:architecture_pattern/core/theme/theme_manager.dart';
import 'package:architecture_pattern/core/di/locator.dart' as di;

class AppProviders {
  static List<BlocProvider> get blocProviders => [
        BlocProvider<ThemeCubit>(
          create: (_) => di.getIt<ThemeCubit>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => di.getIt<AuthBloc>(),
        ),
        BlocProvider<ProductBloc>(
          create: (_) => di.getIt<ProductBloc>(),
        ),
        BlocProvider<LanguageCubit>(
          create: (_) => di.getIt<LanguageCubit>(),
        ),
        BlocProvider<LogoutBloc>(
          create: (_) => di.getIt<LogoutBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => di.getIt<ProfileBloc>()..add(LoadProfile()),
        ),
        // Add more bloc providers here
      ];
}