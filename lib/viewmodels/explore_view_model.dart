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

  List<Data> get categories => _categories;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ExploreViewModel() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      Category categoryResponse = await _categoryService.fetchCategories();
      _categories = categoryResponse.data ?? [];
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // New function to fetch products by category ID
  Future<void> fetchProductsByCategory(int categoryId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _productService.fetchProductsByCategory(categoryId);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}