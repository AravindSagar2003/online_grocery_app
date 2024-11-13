import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/models/categorymodel.dart';
import 'package:online_grocery_app_ui/models/productmodel.dart';
import 'package:online_grocery_app_ui/services/category_category.dart';

import 'package:online_grocery_app_ui/services/product_service.dart';

class ExploreViewModel extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();
  final ProductService _productService = ProductService();

  List<Data> _categories = [];
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  bool _isDisposed = false; // Track if the ViewModel has been disposed

  List<Data> get categories => _categories;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ExploreViewModel() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    if (_isDisposed) return; // Prevent further operations if disposed
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      Category categoryResponse = await _categoryService.fetchCategories();
      if (_isDisposed) return; // Check if the ViewModel is disposed
      _categories = categoryResponse.data ?? [];
    } catch (error) {
      if (_isDisposed) return; // Check if the ViewModel is disposed
      _errorMessage = error.toString();
    } finally {
      if (_isDisposed) return; // Check if the ViewModel is disposed
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch products by category ID with disposal check
  Future<void> fetchProductsByCategory(int categoryId) async {
    if (_isDisposed) return; // Prevent further operations if disposed
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _productService.fetchProductsByCategory(categoryId);
    } catch (error) {
      if (_isDisposed) return; // Check if the ViewModel is disposed
      _errorMessage = error.toString();
    } finally {
      if (_isDisposed) return; // Check if the ViewModel is disposed
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true; // Mark as disposed
    super.dispose();
  }
}
