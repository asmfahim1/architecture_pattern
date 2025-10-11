import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  // 🧩 Pre-resolve SharedPreferences because it's async
  @preResolve
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();

  // 🧩 Dio client (you can add interceptors here later)
  @lazySingleton
  Dio get dio => Dio();
}