// app_version_manager.dart
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionManager {
  static AppVersionManager? _instance;
  PackageInfo? _packageInfo;

  AppVersionManager._();

  static AppVersionManager get instance {
    _instance ??= AppVersionManager._();
    return _instance!;
  }

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  String get appName => _packageInfo?.appName ?? '';
  String get packageName => _packageInfo?.packageName ?? '';
  String get version => _packageInfo?.version ?? '';
  String get buildNumber => _packageInfo?.buildNumber ?? '';
  String get fullVersion => 'v$version ($buildNumber)';
}