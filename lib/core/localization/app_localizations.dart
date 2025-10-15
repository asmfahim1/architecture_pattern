class AppLanguage {
  static const supportedLanguages = ['en', 'bn'];
  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      'settings': 'Settings',
      'logout': 'Logout',
      'change_language': 'Change Language',
      'change_theme': 'Change Theme',
      'dark_theme': 'Dark Theme',
      'light_theme': 'Light Theme',
      'change_language_description': 'Change the language of the app',
      'change_theme_description': 'Change the theme of the app',
      'logout_description': 'Logout from the app',
      'settings_description': 'Settings of the app',
      'change_language_title': 'Change Language',
      // ... other keys
    },
    'bn': {
      'settings': 'সেটিংস',
      'logout': 'প্রস্থান',
      'change_language': 'ভাষা পরিবর্তন করুন',
      'change_theme': 'থিম পরিবর্তন করুন',
      'dark_theme': 'ডার্ক থিম',
      'light_theme': 'লাইট থিম',
      'change_language_description': 'অ্যাপের ভাষা পরিবর্তন করুন',
      'change_theme_description': 'অ্যাপের থিম পরিবর্তন করুন',
      'logout_description': 'অ্যাপ থেকে প্রস্থান করুন',
      'settings_description': 'অ্যাপের সেটিংস',
      'change_language_title': 'ভাষা পরিবর্তন করুন',
      // ... other keys
    },
  };

  static String get(String key, String lang) {
    return localizedValues[lang]?[key] ?? key;
  }
}