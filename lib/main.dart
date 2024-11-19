import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/routes/routename.dart';
import 'package:online_grocery_app_ui/routes/routes.dart';
import 'package:online_grocery_app_ui/viewmodels/cart_view_model.dart';
import 'package:online_grocery_app_ui/viewmodels/explore_view_model.dart';
import 'package:online_grocery_app_ui/viewmodels/signin_view_model.dart';
import 'package:online_grocery_app_ui/views/loginScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ChangeNotifierProvider(create: (_) => ExploreViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),

      ],
      child: MaterialApp(
        initialRoute: AppRoute.loginScreen,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
