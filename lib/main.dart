import 'package:architecture_pattern/core/firebase_manager/firebase_notification_service.dart';
import 'package:architecture_pattern/core/routes/app_routes.dart';
import 'package:architecture_pattern/core/routes/bindings.dart';
import 'package:architecture_pattern/core/theme/theme_manager.dart';
import 'package:architecture_pattern/core/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Dependency injection
import 'core/di/locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  await FirebaseNotificationService.initLocalOnly();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.blocProviders,
      child: Builder(
        builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
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
                initialRoute: '/',
                routes: AppRoutes.routes,
              );
            },
          );
        },
      ),
    );
  }
}
