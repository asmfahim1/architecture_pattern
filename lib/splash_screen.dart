import 'package:architecture_pattern/core/env/env_config.dart';
import 'package:architecture_pattern/core/env/env_factory.dart';
import 'package:architecture_pattern/core/localization/language_manager.dart';
import 'package:architecture_pattern/core/storae/session_manager.dart';
import 'package:architecture_pattern/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _language = getIt<LanguageCubit>();

  final AppEnvConfig _env = getIt<EnvFactory>().getEnv();

  final SessionManager _sessionManager = getIt<SessionManager>();

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final authToken = _sessionManager.authToken;
    final isLoggedIn = authToken != null && authToken.isNotEmpty;

    await Future.delayed(const Duration(seconds: 2)); // Show splash for at least 2 seconds

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: FlutterLogo(size: 100)),
    );
  }
}
