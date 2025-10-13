import 'dart:ui';

import 'package:architecture_pattern/core/env/env_config.dart';

class LocalEnvConfig extends AppEnvConfig {
  @override
  String get baseUrl => 'http://localhost:8080';

  @override
  String get apiKey => 'local_api_key';

  @override
  bool get isDebug => false;

  @override
  // TODO: implement accentColor
  Color get accentColor => throw UnimplementedError();

  @override
  // TODO: implement appName
  String get appName => throw UnimplementedError();

  @override
  // TODO: implement logo
  String get logo => throw UnimplementedError();

  @override
  // TODO: implement primaryColor
  Color get primaryColor => throw UnimplementedError();

  @override
  // TODO: implement secondaryColor
  Color get secondaryColor => throw UnimplementedError();
}
