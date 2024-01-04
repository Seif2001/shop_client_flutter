import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop_app/Models/product.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shop_app/prefrences/auth_pref.dart';

class StoreService {
  static const String baseUrl = 'http://192.168.100.8:3000/store/';

  static Future<List<String>> fetchStores() async {
    final Uri uri = Uri.parse(baseUrl);
    String? token = await TokenPreferences.getAuthToken();

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer "$token"',
      },
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

  static Future<List<Product>> fetchStoreProducts(String store) async {
    final Uri uri = Uri.parse(baseUrl + "getProducts/" + store);
    String? token = await TokenPreferences.getAuthToken();

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer "$token"',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic>? responseData = jsonDecode(response.body);
      print("STORE PRODUCTS: $responseData");
      final List<Product> products = (responseData
              ?.map((dynamic json) => Product.fromJson(json))
              .toList() ??
          []);
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<bool> addProduct(
      String name, String price, File image, String storeId) async {
    final Uri uri = Uri.parse(baseUrl + "createProduct/$storeId");
    String? token = await TokenPreferences.getAuthToken();

    // Create a MultipartRequest
    final request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';

    // Add fields to the request
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['store'] = storeId;

    // Add the image file to the request
    if (image != null) {
      final imageStream = http.ByteStream(image.openRead());
      final imageLength = await image.length();
      final imageMultipartFile = http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: 'product_image.jpg', // Set the filename as needed
        contentType: MediaType(
            'image', 'jpeg'), // Set the content type based on the image type
      );
      request.files.add(imageMultipartFile);
    }

    try {
      // Send the request and get the response
      final response = await http.Response.fromStream(await request.send());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final String product = response.body;
        print("Product added: $product");
        return true;
      } else {
        throw Exception('Failed to add product');
      }
    } catch (error) {
      throw Exception('Failed to add product: $error');
    }
  }
}
