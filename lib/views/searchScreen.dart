import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/widgets/homescreenCustomwidget2.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  // Sample data for the grid
  final List<Map<String, dynamic>> items = [
    {
      'image': 'asset/images/eggChicken.png',
      'title': 'Egg Chicken Red',
      'subtitle': '4pcs, Price',
      'price': 1.99,
    },
    {
      'image': 'asset/images/broccoli.png',
      'title': 'Fresh Broccoli',
      'subtitle': '500g, Price',
      'price': 2.50,
    },
    {
      'image': 'asset/images/apple.png',
      'title': 'Red Apple',
      'subtitle': '1kg, Price',
      'price': 3.99,
    },
    // Add more items as needed
  ];

  // A list to hold the filtered search results
  List<Map<String, dynamic>> filteredItems = [];

  // To track the current search input
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Initially, all items are displayed
    filteredItems = items;
  }

  void updateSearchResults(String query) {
    setState(() {
      searchQuery = query;

      // If the search query is not empty, filter the items
      if (query.isNotEmpty) {
        filteredItems = items.where((item) {
          final titleLower = item['title'].toLowerCase();
          final searchLower = query.toLowerCase();
          return titleLower.contains(searchLower);
        }).toList();
      } else {
        // If the search query is empty, show all items
        filteredItems = items;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: updateSearchResults, // Updates search results as user types
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF2F3F2),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search Item',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.tune),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: .7,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = filteredItems[index];
                  return HomeScreenCustomWidget2(
                    ontab: () {
                      // Define your tap action here
                      print("Tapped on item $index");
                    },
                    image: item['image'],
                    title: item['title'],
                    subtitle: item['subtitle'],
                    price: item['price'],
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
