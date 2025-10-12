import 'package:architecture_pattern/core/errors/exceptions.dart';
import 'package:architecture_pattern/features/dashboard/data/datasource/product_remote_datasource.dart';
import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';
import 'package:architecture_pattern/features/dashboard/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductModel>> getProducts(int page, int perPage) async {
    try {
      final result = await remoteDataSource.getProducts(page, perPage);
      final List<dynamic> data = result['data'] as List<dynamic>;
      return data.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      throw ServerException('Failed to load products');
    }
  }

  @override
  Future<int> getTotalPages(int perPage) async {
    try {
      final result = await remoteDataSource.getProducts(1, perPage);
      final int total = result['total'] as int;
      return (total / perPage).ceil();
    } catch (e) {
      throw ServerException('Failed to get total pages');
    }
  }
}