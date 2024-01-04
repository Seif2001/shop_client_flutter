import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/helpers/sortby_enum.dart';
import 'package:shop_app/prefrences/auth_pref.dart';

class ProductService {
  static const String baseUrl = 'http://192.168.100.8:3000/customer/products';

  static Future<List<Product>> fetchProducts({
    String? store,
    SortBy? sortBy,
  }) async {
    final Uri uri = Uri.parse(baseUrl);

    final Map<String, String> queryParams = {};
    if (store != null) {
      if (store != 'All') {
        queryParams['store'] = store;
      }
    }
    if (sortBy != null) {
      if (sortBy == SortBy.Alphabetical) {
        queryParams['sortBy'] = "nameAsc";
      }
      if (sortBy == SortBy.PriceHighToLow) {
        queryParams['sortBy'] = "priceDesc";
      }
      if (sortBy == SortBy.PriceLowToHigh) {
        queryParams['sortBy'] = "priceAsc";
      }
    }

    final Uri requestUri = uri.replace(queryParameters: queryParams);
    print('Request URI: $requestUri');
    String? token = await TokenPreferences.getAuthToken();

    final response = await http.get(
      requestUri,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic>? responseData = jsonDecode(response.body);
      final List<Product> products = (responseData
              ?.map((dynamic json) => Product.fromJson(json))
              .toList() ??
          []);
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
