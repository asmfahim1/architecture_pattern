// Product State
import 'package:architecture_pattern/data/models/product_model.dart';

class ProductState {
  final bool isLoading;
  final List<ProductModel> products;
  final String? error;

  ProductState({
    required this.isLoading,
    required this.products,
    this.error,
  });

  factory ProductState.initial() {
    return ProductState(
      isLoading: false,
      products: [],
    );
  }

  ProductState copyWith({
    bool? isLoading,
    List<ProductModel>? products,
    String? error,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      error: error,
    );
  }
}