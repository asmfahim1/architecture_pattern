// features/product/presentation/bloc/product_state.dart

part of 'product_bloc.dart';


abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final int currentPage;
  final int totalPages;

  ProductLoaded({
    required this.products,
    required this.currentPage,
    required this.totalPages,
  });
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
