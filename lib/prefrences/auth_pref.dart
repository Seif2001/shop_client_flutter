import 'package:shared_preferences/shared_preferences.dart';

class TokenPreferences {
  static const String _keyAuthToken = 'token';

  static Future<void> saveAuthToken(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyAuthToken, authToken);
  }

  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAuthToken);
  }

  static Future<void> clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyAuthToken);
  }
}
