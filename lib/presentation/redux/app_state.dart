// presentation/redux/app_state.dart
import 'package:architecture_pattern/presentation/redux/auth_state.dart';
import 'package:architecture_pattern/presentation/redux/language_state.dart';
import 'package:architecture_pattern/presentation/redux/product_state.dart';
import 'package:architecture_pattern/presentation/redux/theme_state.dart';

class AppState {
  final AuthState authState;
  final ThemeState themeState;
  final LanguageState languageState;
  final ProductState productState;

  AppState({
    required this.authState,
    required this.themeState,
    required this.languageState,
    required this.productState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      themeState: ThemeState.initial(),
      languageState: LanguageState.initial(),
      productState: ProductState.initial(),
    );
  }

  AppState copyWith({
    AuthState? authState,
    ThemeState? themeState,
    LanguageState? languageState,
    ProductState? productState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      themeState: themeState ?? this.themeState,
      languageState: languageState ?? this.languageState,
      productState: productState ?? this.productState,
    );
  }
}
