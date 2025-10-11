import 'package:architecture_pattern/core/theme/theme_manager.dart';
import 'package:architecture_pattern/core/utils/app_localization.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:architecture_pattern/features/auth/presentation/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Dependency injection
import 'core/di/locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeCubit _themeCubit = di.sl<ThemeCubit>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Clean Flutter Starter',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
            supportedLocales: const [Locale('en'), Locale('bn')],
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: BlocProvider(
              create: (_) => di.sl<AuthBloc>(),
              child: LoginPage(),
            ),
            /*routes: {
              '/home': (ctx) => BlocProvider(
                create: (_) => di.sl<PostBloc>(),
                child: HomePage(),
              ),
            },*/
          );
        },
      ),
    );
  }
}
