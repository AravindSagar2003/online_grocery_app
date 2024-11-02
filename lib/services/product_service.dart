import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_grocery_app_ui/models/Fetchproduct.dart';
import 'package:online_grocery_app_ui/models/productmodel.dart';
import 'package:online_grocery_app_ui/utils/api_constants.dart';


class ProductService {
  final String apiUrl = '$baseurl/viewProduct/';

  Future<List<FetchProduct>> fetchProductsbyid(int categoryId) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((product) => FetchProduct.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<FetchProduct> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return FetchProduct.fromJson(jsonData);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> fetchProductsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('$baseurl/items/Category/$categoryId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // Check if response is successful and has data
      if (jsonData['success'] == true && jsonData['data'] != null) {
        return (jsonData['data'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception('No products found for this category');
      }
    } else {
      throw Exception('Failed to load products');
    }
  }

}
