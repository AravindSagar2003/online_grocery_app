import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/services/add_to_favourites.dart';
import 'package:online_grocery_app_ui/widgets/custombuttonWidget.dart';

import 'favouriteScreen.dart';
import 'mycartScreen.dart';

class Productdetailscreen extends StatefulWidget {
  Productdetailscreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      });

  final String image;
  final String title;
  final String subtitle;
  String price;

  @override
  State<Productdetailscreen> createState() => _ProductdetailscreenState();
}

class _ProductdetailscreenState extends State<Productdetailscreen> {
  int itemCount = 0;
  bool isFavorite = false; // Track if the product is in favorites

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void initState() {
    print(isFavorite);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Color(0xff181725),
                            fontWeight: FontWeight.bold,
                            fontSize: ht / 37.48),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: isFavorite ? Colors.red : null,
                          size: ht / 37.48,
                        ),
                        onPressed: () {
                          // if (isFavorite) {
                          //   deleteFromFav(values: widget.value);
                          //   _toggleFavorite();
                          // } else {
                          //   _toggleFavorite();
                          //   addToFav(values: widget.value);
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Favouritescreen()),
                          //   );
                          // }
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (itemCount > 0) {
                                itemCount--;
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            color: Color(0xffB3B3B3),
                            size: 20,
                          )),
                      SizedBox(width: 15),
                      Container(
                        height: ht / 22.48,
                        width: wt / 10.29,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text('$itemCount'),
                        ),
                      ),
                      SizedBox(width: 15),
                      InkWell(
                          onTap: () {
                            setState(() {
                              itemCount++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 20,
                          )),
                      Spacer(),
                      Text(
                        '\$${widget.price}',
                        style: TextStyle(
                            fontSize: ht / 37.48, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Divider(
                    height: 8,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Detail',
                        style: TextStyle(
                            color: Color(0xff181725),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp)
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthy and varied diet.',
                    style: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 8,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'Nutritions',
                        style: TextStyle(
                            color: Color(0xff181725),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Container(
                        height: ht / 44.97,
                        width: wt / 11.75,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff7C7C7C)),
                            color: Color(0xff7C7C7C),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '100 gr',
                            style: TextStyle(fontSize: 9),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 8,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Review',
                        style: TextStyle(
                            color: Color(0xff181725),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffF3603F),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                  SizedBox(height: 25),
                  CustomButtonWidget(
                    text: 'Add To Basket',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mycartscreen()),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
