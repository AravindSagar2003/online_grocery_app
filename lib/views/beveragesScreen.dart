import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/widgets/productcard.dart';
import 'package:provider/provider.dart';
import '../viewmodels/explore_view_model.dart';
import '../widgets/homescreenCustomwidget2.dart';

class Beveragesscreen extends StatefulWidget {
  final int categoryId;
  final String screenName;

  Beveragesscreen({Key? key, required this.categoryId, required this.screenName}) : super(key: key);

  @override
  State<Beveragesscreen> createState() => _BeveragesscreenState();
}

class _BeveragesscreenState extends State<Beveragesscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<ExploreViewModel>(context, listen: false);
      viewModel.fetchProductsByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;
    final viewModel = Provider.of<ExploreViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              widget.screenName,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff181725),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            if (viewModel.isLoading)
              Center(child: CircularProgressIndicator())
            else if (viewModel.errorMessage != null)
              Center(child: Text(viewModel.errorMessage!))
            else
              Expanded(
                child: GridView.builder(
  itemCount: viewModel.products.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: .6,
  ),
  itemBuilder: (context, index) {
    final product = viewModel.products[index];
    return ProductCard(
      ontab: () {
        // Add your navigation or onTap logic here
      },
      image: product.image,
      title: product.productName,
      subtitle: '${product.price} ml, Price',
      price: product.price,
    );
  },
),

              ),
          ],
        ),
      ),
    );
  }
}
