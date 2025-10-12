import 'package:architecture_pattern/core/network/api_client.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<Map<String, dynamic>> getProducts(int page, int perPage);
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<Map<String, dynamic>> getProducts(int page, int perPage) async {
    final response = await client.get(
      'https://reqres.in/api/unknown',
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );
    return response.data as Map<String, dynamic>;
  }
}