import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/models/productmodel.dart';
import '../views/productdetailScreen.dart'; // Import your ProductDetailsScreen

class HomeScreenCustomWidget2 extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String productId;  // Add a productId to the widget to pass to the detail screen
  final void Function() ontab;

  HomeScreenCustomWidget2({
    Key? key,
    required this.image,
    required this.ontab,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.productId,  // Ensure productId is passed in constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to ProductDetailsScreen and pass productId
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: Product(id:int.tryParse(productId)! , productName: title, price: price, image: image, category: 2), productId:int.tryParse(productId)!,),
            ),
          );
        },
        child: SizedBox(
          height: 270,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: 173.32,
              height: 248.51,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.21,
                      width: 133.73,
                    ),
                    Image.asset(
                      image,
                      width: 99.89,
                      height: 79.43,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff181725),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: Color(0xff7C7C7C),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff181725),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(47.67, 47.67),
                            backgroundColor: Color(0xff53B175),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Handle add to cart logic here
                          },
                          child: Icon(
                            Icons.add,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
