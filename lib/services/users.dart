import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/Models/user.dart';

class UserService {
  static const String baseUrl = 'http://192.168.100.8:3000/customer/checkphone';

  static Future<bool> checkNumber(String number) async {
    final Uri uri = Uri.parse(baseUrl);

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'phone': number,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['found'] == 'true') {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to load stores');
    }
  }

  static Future<bool> registerUser(User user) async {
    final Uri uri = Uri.parse('http://192.168.100.8:3000/auth/signup');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'phone': user.phone,
        'password': user.password,
        'name': user.name,
        'isStore': user.isStore.toString(),
        'address': user.address,
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to register user');
    }
  }

  static Future<User> loginUser(String phone, String password) async {
    final Uri uri = Uri.parse('http://http://192.168.100.8:3000/auth/login');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'phone': phone,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String user = User.fromJson(responseData);
      return user;
    } else {
      throw Exception('Failed to login user');
    }
  }
}
