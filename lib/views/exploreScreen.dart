import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/viewmodels/explore_view_model.dart';
import 'package:online_grocery_app_ui/views/beveragesScreen.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExploreViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Find Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F3F2),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search Store',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Consumer<ExploreViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (viewModel.errorMessage != null) {
                      return Center(child: Text('Error: ${viewModel.errorMessage}'));
                    } else if (viewModel.categories.isEmpty) {
                      return Center(child: Text('No categories available.'));
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: viewModel.categories.length,
                        itemBuilder: (context, index) {
                          final category = viewModel.categories[index];
                          return GestureDetector(
                            onTap: () {
                              // viewModel.navigateToCategoryScreen(
                              //   context,
                              //   category.categoryname ?? '',
                              // );

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Beveragesscreen(categoryId: index+1,screenName:category.categoryname ?? 'Unnamed Category' ,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffF2F3F2),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      category.categoryimage != null
                                          ? Image.network(category.categoryimage!)
                                          : Icon(Icons.category),
                                      SizedBox(height: 20),
                                      Text(
                                        category.categoryname ?? 'Unnamed Category',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
