import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SessionManager {
  static const String _authTokenKey = 'auth_token';
  final SharedPreferences _prefs;

  SessionManager(this._prefs);

  // Save authentication token
  Future<bool> saveAuthToken(String token) async {
    return await _prefs.setString(_authTokenKey, token);
  }

  // Get authentication token
  String? get authToken {
    return _prefs.getString(_authTokenKey);
  }

  // Clear authentication token
  Future<bool> clearAuthToken() async {
    return await _prefs.remove(_authTokenKey);
  }

  // Check if user is authenticated
  bool get isAuthenticated {
    return authToken != null && authToken!.isNotEmpty;
  }

  // Clear all session data
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
