import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Clean Flutter Starter',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'fetch_posts': 'Fetch Posts',
      'logout': 'Logout',
    },
    'bn': {
      'title': 'ক্লিন ফ্লাটার স্টার্টার',
      'login': 'লগইন',
      'email': 'ইমেইল',
      'password': 'পাসওয়ার্ড',
      'fetch_posts': 'পোস্ট লোড করুন',
      'logout': 'লগআউট',
    }
  };

  String get(String key) => _localizedValues[locale.languageCode]?[key] ??
      _localizedValues['en']![key] ??
      key;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'bn'].contains(locale.languageCode);
  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
