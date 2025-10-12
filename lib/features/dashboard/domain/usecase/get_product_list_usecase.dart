// features/product/domain/usecases/get_products.dart
import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';
import 'package:architecture_pattern/features/dashboard/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductModel>> call(ProductParams params) async {
    return await repository.getProducts(params.page, params.perPage);
  }
}

class ProductParams {
  final int page;
  final int perPage;

  ProductParams({required this.page, required this.perPage});
}
