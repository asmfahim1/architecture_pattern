// presentation/redux/reducers/language_reducer.dart
import 'package:architecture_pattern/presentation/redux/actions/language_action.dart';
import 'package:architecture_pattern/presentation/redux/language_state.dart';

LanguageState languageReducer(LanguageState state, dynamic action) {
  if (action is ChangeLanguageAction) {
    return state.copyWith(locale: action.locale);
  }
  return state;
}
