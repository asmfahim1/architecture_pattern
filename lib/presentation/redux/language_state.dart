// Language State
import 'package:flutter/material.dart';

class LanguageState {
  final Locale locale;

  LanguageState({required this.locale});

  factory LanguageState.initial() {
    return LanguageState(locale: const Locale('en'));
  }

  LanguageState copyWith({Locale? locale}) {
    return LanguageState(locale: locale ?? this.locale);
  }
}
