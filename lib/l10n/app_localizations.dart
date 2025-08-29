import 'package:architecture_pattern/core/utils/session_manager.dart';
import 'package:flutter/material.dart';

class LocaleManager {
  LocaleManager();


  Locale get initialLocale {
    final code = PrefHelper.getString('locale_code') ?? 'en';
    return Locale(code);
  }


  Future<void> setLocale(Locale locale) async {
    await PrefHelper.setString('locale_code', locale.languageCode);
  }
}