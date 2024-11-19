import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/models/productmodel.dart';
import 'package:online_grocery_app_ui/services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _productService = ProductService();

  List<Product> _products = [];
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _productService.fetchAllProducts();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductById(int productId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _selectedProduct = await _productService.fetchProductById(productId);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
