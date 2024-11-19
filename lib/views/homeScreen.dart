import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/viewmodels/Fetchall_products_view_model.dart';
import 'package:online_grocery_app_ui/views/productdetailScreen.dart';

import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductViewModel()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          backgroundColor: Colors.green,
        ),
        body: Consumer<ProductViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (viewModel.errorMessage != null) {
              return Center(child: Text('Error: ${viewModel.errorMessage}'));
            } else if (viewModel.products.isEmpty) {
              return Center(child: Text('No products found.'));
            } else {
              return ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return ListTile(
                    leading: Image.network(product.image),
                    title: Text(product.productName),
                    subtitle: Text('Price: ${product.price}'),
                    onTap: () {
                      // Navigate to ProductDetailsScreen with the selected product
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(productId: product.id, product: product,),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
