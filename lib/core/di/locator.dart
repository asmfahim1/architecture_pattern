// lib/core/di/locator.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';
import 'app_module.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();
