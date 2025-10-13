import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SessionManager {
  static const String _authTokenKey = 'auth_token';
  SharedPreferences? _prefs;

  // Initialize the SharedPreferences instance
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save authentication token
  Future<bool> saveAuthToken(String token) async {
    return await _prefs?.setString(_authTokenKey, token) ?? false;
  }

  // Get authentication token
  String? get authToken {
    return _prefs?.getString(_authTokenKey);
  }

  // Clear authentication token
  Future<bool> clearAuthToken() async {
    return await _prefs?.remove(_authTokenKey) ?? false;
  }

  // Check if user is authenticated
  bool get isAuthenticated {
    return authToken != null && authToken!.isNotEmpty;
  }

  // Clear all session data
  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
