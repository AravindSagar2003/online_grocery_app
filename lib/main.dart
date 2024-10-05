import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/views/accountScreen.dart';
import 'package:online_grocery_app_ui/views/beveragesScreen.dart';
import 'package:online_grocery_app_ui/views/bottomnavigationbar.dart';
import 'package:online_grocery_app_ui/views/exploreScreen.dart';
import 'package:online_grocery_app_ui/views/favouriteScreen.dart';
import 'package:online_grocery_app_ui/views/filterScreen.dart';
import 'package:online_grocery_app_ui/views/mycartScreen.dart';
import 'package:online_grocery_app_ui/views/orderacceptedScreen.dart';
import 'package:online_grocery_app_ui/views/productdetailScreen.dart';
import 'package:online_grocery_app_ui/views/searchScreen.dart';
import 'package:online_grocery_app_ui/views/signupScreen.dart';

import 'views/cardScreen.dart';
import 'views/homeScreen.dart';
import 'views/locationScreen.dart';
import 'views/loginScreen.dart';
import 'views/singinScreen.dart';
import 'views/splashScreen.dart';
import 'views/onboardingScreen.dart';

void main() {
  runApp(MaterialApp(

    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Gilroy'
    ),
    home: Onboardingscreen(),
  ));
}
