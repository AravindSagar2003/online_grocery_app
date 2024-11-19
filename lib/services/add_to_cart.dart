// 

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_grocery_app_ui/models/cart_model.dart';
import 'package:online_grocery_app_ui/utils/api_constants.dart';

class CartService {
  // Base URL of your API

  // Function to add an item to the cart
  Future<Map<String, dynamic>> addToCart({required String itemId, required String userId}) async {
  final url = Uri.parse('$baseurl/addCart/'); // Update with your API URL
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      
    },
    body: jsonEncode({
      'productid': itemId,
      'userid': userId,
    }),
  );



  print(response.body);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to add item to cart');
  }
}


  Future<List<Cart>> fetchCartItems(int userId) async {
    // Make sure baseurl is defined correctly and ends with a slash
    final apiUrl = Uri.parse(
        "$baseurl/viewSingleCart/$userId"); // Replace with your API URL

    print(userId);

    try {
      final response = await http.get(apiUrl); // No need to parse again
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        // Decode the JSON response

        final jsonData = json.decode(response.body);

        // Convert the JSON data to a list of Cart objects
        return jsonData.map<Cart>((item) => Cart.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load cart items. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load cart items: $e');
    }
  }

  Future<bool> incrementItemQuantity(String itemId, String userId) async {
    try {
      final response = await http.post(
        Uri.parse("$baseurl/increment_quantity/"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'itemid': itemId, 'userid': userId}),
      );

      print('Increment Response: ${response.statusCode}, ${response.body}');
      return response.statusCode == 200;
    } catch (e) {
      print('Error incrementing item: $e');
      return false;
    }
  }

  Future<bool> decrementItemQuantity(String itemId, String userId) async {
    try {
      final response = await http.post(
        Uri.parse("$baseurl/decrement_quantity/"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'itemid': itemId, 'userid': userId}),
      );

      print('Decrement Response: ${response.statusCode}, ${response.body}');
      return response.statusCode == 200;
    } catch (e) {
      print('Error decrementing item: $e');
      return false;
    }
  }
}