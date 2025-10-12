import 'dart:convert';

class JsonUtils {
  static Map<String, dynamic>? parseString(String json) {
    try {
      return jsonDecode(json);
    } catch (e) {
      return null;
    }
  }
}