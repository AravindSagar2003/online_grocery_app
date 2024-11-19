import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_grocery_app_ui/models/Fetchproduct.dart';
import 'package:online_grocery_app_ui/models/productmodel.dart';
import 'package:online_grocery_app_ui/utils/api_constants.dart';

class ProductService {
  // Base URL for the API
  final String baseUrl = "https://groceryapi-om1i.onrender.com";

  // Fetch all products
  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/viewProduct/'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final productResponse = ProductResponse.fromJson(jsonData);

      if (productResponse.success && productResponse.data.isNotEmpty) {
        return productResponse.data;
      } else {
        throw Exception('Failed to fetch products: ${productResponse.message}');
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  // Fetch a product by its ID
  Future<Product> fetchProductById(int productId) async {
    final response = await http.get(Uri.parse('$baseUrl/viewSingleProduct/$productId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final productResponse = ProductResponse.fromJson(jsonData);

      if (productResponse.success && productResponse.data.isNotEmpty) {
        return productResponse.data.first;
      } else {
        throw Exception('Failed to fetch product details or product not found.');
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  // Fetch products by category ID
  Future<List<Product>> fetchProductsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/items/Category/$categoryId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData['success'] == true && jsonData['data'] != null) {
        return (jsonData['data'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception('No products found for this category');
      }
    } else {
      throw Exception('Failed to load products for category');
    }
  }

  // Fetch products by category ID (using FetchProduct model)
  Future<List<FetchProduct>> fetchProductsbyid(int categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/viewProduct'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      
      // Check if data is available
      if (jsonData.isNotEmpty) {
        return jsonData.map((product) => FetchProduct.fromJson(product)).toList();
      } else {
        throw Exception('No products found.');
      }
    } else {
      throw Exception('Failed to load products');
    }
  }
}
