import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/models/Fetchproduct.dart';
import 'package:online_grocery_app_ui/services/product_service.dart';


class Detailsviewmodel extends ChangeNotifier {
  final ProductService productService = ProductService();
  List<FetchProduct> _products = [];
  List<FetchProduct> categoryproducts = [];
  bool _isLoading = false;

  List<FetchProduct> get products => _products;
  bool get isLoading => _isLoading;

  // Future<void> fetchProducts() async {
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     _products = await _apiService.fetchProducts();
  //     print(_products);
  //   } catch (e) {
  //     print("Error fetching products: $e");
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> fetchProductsByProductId(int categoryId) async {
    _isLoading = true;
    notifyListeners();

    try {
      categoryproducts =
          await productService.fetchProductsbyid(categoryId);
      print('------------------------------------------------------');
      print(categoryproducts);
    } catch (error) {
      print("Error fetching products: $error");
      // Handle errors as needed
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
}