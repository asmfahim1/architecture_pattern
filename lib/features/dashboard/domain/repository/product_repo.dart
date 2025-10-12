// features/product/domain/usecases/get_total_pages.dart

import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts(int page, int perPage);
  Future<int> getTotalPages(int perPage);
}