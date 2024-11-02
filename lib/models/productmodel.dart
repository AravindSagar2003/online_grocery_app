class Product {
  final int id;
  final String productName;
  final String price;
  final String image;
  final int category;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.image,
    required this.category,
  });

  // Factory constructor to create a Product instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productName: json['productname'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
    );
  }
}

class ProductResponse {
  final List<Product> data;
  final String message;
  final bool success;

  ProductResponse({
    required this.data,
    required this.message,
    required this.success,
  });

  // Factory constructor to create a ProductResponse instance from JSON
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      data: (json['data'] as List).map((item) => Product.fromJson(item)).toList(),
      message: json['message'],
      success: json['success'],
    );
  }
}
