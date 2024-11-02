import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/routes/routename.dart';
import 'package:online_grocery_app_ui/views/bottomnavigationbar.dart';
import 'package:online_grocery_app_ui/views/loginScreen.dart';
import 'package:online_grocery_app_ui/views/onboardingScreen.dart';
import 'package:online_grocery_app_ui/views/productdetailScreen.dart';
import 'package:online_grocery_app_ui/views/signupScreen.dart';
import 'package:online_grocery_app_ui/views/splashScreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => Onboardingscreen());

    case AppRoute.loginScreen:
      final String? name = routeSettings.arguments as String?;
      return MaterialPageRoute(
        builder: (context) => Loginscreen(zone: name), // Assuming `zone` or similar prop
      );

    case AppRoute.onboardingscreen:
      return MaterialPageRoute(builder: (context) => Onboardingscreen());

    case AppRoute.signupscreen:
      return MaterialPageRoute(builder: (context) => Signupscreen());

    case AppRoute.bottomNavigationBar:
      return MaterialPageRoute(builder: (context) => Bottomnavigationbar());

    case AppRoute.splashscreen:
      return MaterialPageRoute(builder: (context) => Splashscreen());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${routeSettings.name}')),
        ),
      );
  }
}
