import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageState {
  final String languageCode;
  LanguageState(this.languageCode);
}

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences prefs;
  static const _key = 'languageCode';
  static const _default = 'en';

  LanguageCubit(this.prefs) : super(LanguageState(prefs.getString(_key) ?? _default));

  void switchTo(String code) {
    prefs.setString(_key, code);
    emit(LanguageState(code));
  }
}