// presentation/redux/reducers/product_reducer.dart
import 'package:architecture_pattern/presentation/redux/actions/product_actions.dart';
import 'package:architecture_pattern/presentation/redux/product_state.dart';

ProductState productReducer(ProductState state, dynamic action) {
  if (action is FetchProductsAction) {
    return state.copyWith(isLoading: true, error: null);
  } else if (action is FetchProductsSuccessAction) {
    return state.copyWith(
      isLoading: false,
      products: action.products,
      error: null,
    );
  } else if (action is FetchProductsFailureAction) {
    return state.copyWith(isLoading: false, error: action.error);
  }
  return state;
}