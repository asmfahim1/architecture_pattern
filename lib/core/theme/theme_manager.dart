import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState {
  final bool isDark;
  ThemeState(this.isDark);
}

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences prefs;
  static const _key = 'isDark';

  ThemeCubit(this.prefs) : super(ThemeState(prefs.getBool(_key) ?? false));

  void toggle() {
    final next = !state.isDark;
    prefs.setBool(_key, next);
    emit(ThemeState(next));
  }
}
