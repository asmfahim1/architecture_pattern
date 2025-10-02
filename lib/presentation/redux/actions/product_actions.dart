import 'package:architecture_pattern/data/models/product_model.dart';

class FetchProductsAction {}

class FetchProductsSuccessAction {
  final List<ProductModel> products;

  FetchProductsSuccessAction(this.products);
}

class FetchProductsFailureAction {
  final String error;

  FetchProductsFailureAction(this.error);
}

class CreateProductAction {
  final String title;
  final String description;
  final double price;
  final String? imagePath;

  CreateProductAction({
    required this.title,
    required this.description,
    required this.price,
    this.imagePath,
  });
}