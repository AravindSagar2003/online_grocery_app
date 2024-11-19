import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodels/cart_view_model.dart';
import '../widgets/custombuttonWidget.dart';
import 'orderacceptedScreen.dart';

class Mycartscreen extends StatefulWidget {
  const Mycartscreen({super.key});

  @override
  State<Mycartscreen> createState() => _MycartscreenState();
}

class _MycartscreenState extends State<Mycartscreen> {
  @override
  void initState() {
    super.initState();

    // Fetch cart items when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      final cartViewModel = Provider.of<CartViewModel>(context, listen: false);

SharedPreferences prefs= await SharedPreferences.getInstance();
                  String ? log_id =await prefs.getString('login_id');
      cartViewModel.fetchCartItems(int.parse(log_id!)); // Replace '1' with the actual user ID
    });
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Consumer<CartViewModel>(
          builder: (context, cartViewModel, child) {
            final cartItems = cartViewModel.cartItems;
            final isLoading = cartViewModel.isLoading;

            return Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'My Cart',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff181725),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                const Divider(height: 5),
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : cartItems.isEmpty
                          ? const Center(child: Text('No items in the cart'))
                          : ListView.builder(
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                final item = cartItems[index];
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            item.image!, // Assuming productImage is a URL
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 25),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.productname!,
                                                style: const TextStyle(
                                                    color: Color(0xff181725),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                             
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // cartViewModel
                                                      //     .decrementItemQuantity(
                                                      //         item.productid,
                                                      //         '1'); // Replace '1' with actual user ID
                                                    },
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Color(0xffB3B3B3),
                                                      size: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Text(item.quantity.toString()),
                                                  const SizedBox(width: 15),
                                                  InkWell(
                                                    onTap: () {
                                                      // cartViewModel
                                                      //     .incrementItemQuantity(
                                                      //         item.productid,
                                                      //         '1'); // Replace '1' with actual user ID
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.green,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            '\$${item.price}',
                                            style: const TextStyle(
                                                color: Color(0xff181725),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close),
                                            onPressed: () {
                                              cartViewModel.removeItemFromCart(
                                                  int.parse(item.userid!));
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const Divider(height: 5),
                                    ],
                                  ),
                                );
                              },
                            ),
                ),
                CustomButtonWidget(
                  text: 'Go To Checkout',
                  action: () {
                    // Handle checkout
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
