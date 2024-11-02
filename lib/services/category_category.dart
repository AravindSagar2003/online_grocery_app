import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_grocery_app_ui/models/categorymodel.dart';

class CategoryService {
  final String apiUrl = 'https://groceryapi-om1i.onrender.com/viewCategory/';

  Future<Category> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response into the Category model
      Map<String, dynamic> jsonData = json.decode(response.body);
      return Category.fromJson(jsonData);
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
