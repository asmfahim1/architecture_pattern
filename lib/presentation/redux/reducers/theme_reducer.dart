// presentation/redux/reducers/theme_reducer.dart
import 'package:architecture_pattern/presentation/redux/actions/theme_actions.dart';
import 'package:architecture_pattern/presentation/redux/theme_state.dart';

ThemeState themeReducer(ThemeState state, dynamic action) {
  if (action is ChangeThemeAction) {
    return state.copyWith(themeMode: action.themeMode);
  }
  return state;
}
