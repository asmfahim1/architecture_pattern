import 'package:architecture_pattern/presentation/redux/app_state.dart';
import 'package:architecture_pattern/presentation/redux/reducers/auth_reducer.dart';
import 'package:architecture_pattern/presentation/redux/reducers/language_reducer.dart';
import 'package:architecture_pattern/presentation/redux/reducers/product_reducer.dart';
import 'package:architecture_pattern/presentation/redux/reducers/theme_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: authReducer(state.authState, action),
    themeState: themeReducer(state.themeState, action),
    languageState: languageReducer(state.languageState, action),
    productState: productReducer(state.productState, action),
  );
}
