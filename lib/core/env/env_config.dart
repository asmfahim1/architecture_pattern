import 'package:flutter/material.dart';

abstract class AppEnvConfig {
  String get baseUrl;

  String get apiKey;

  bool get isDebug;

  String get appName;

  Color get primaryColor;

  Color get secondaryColor;

  Color get accentColor;

  String get logo;
}
