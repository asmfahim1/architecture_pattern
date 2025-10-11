import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio dio;
  ApiClient(this.dio) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) =>
      dio.get(url, queryParameters: queryParameters);

  Future<Response> post(String url, {dynamic data}) => dio.post(url, data: data);

  Future<Response> put(String url, {dynamic data}) => dio.put(url, data: data);

  Future<Response> delete(String url) => dio.delete(url);

  Future<Response> patch(String url, {dynamic data}) => dio.patch(url, data: data);
}