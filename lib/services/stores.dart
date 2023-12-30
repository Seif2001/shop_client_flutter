import 'dart:convert';
import 'package:http/http.dart' as http;

class StoreService {
  static const String baseUrl = 'http://192.168.100.8:3000/store/';

  static Future<List<String>> fetchStores() async {
    final Uri uri = Uri.parse(baseUrl);

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic>? responseData = jsonDecode(response.body);
      final List<String> stores = [
        "All",
        ...(responseData
                ?.map((dynamic json) => json["name"].toString())
                .toList() ??
            [])
      ];
      return stores;
    } else {
      throw Exception('Failed to load stores');
    }
  }
}
