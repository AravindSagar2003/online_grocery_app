import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/routes/routename.dart';
import 'package:online_grocery_app_ui/services/api_services.dart';
import 'package:online_grocery_app_ui/views/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';

class SignInViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  String _errorMessage = '';

  User? get user => _user;
  String get errorMessage => _errorMessage;

  Future<void> googleSignIn() async {
    try {
      _user = await _authService.signInWithGoogle();
      _errorMessage = _user == null ? 'Sign-in failed' : '';
    } catch (e) {
      _errorMessage = 'Error: ${e.toString()}';
    }
    notifyListeners();
  }

  Future<String?>saveLoginState(bool isLoggedin)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedin', isLoggedin);
    return prefs.getString('userId');
  }

  void signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await ApiService().registerUser(
        name: name,
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      
      final userData = await ApiService().loginUser(
        email: email,
        password: password,
      );


      if (userData.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful'),
          ),
        );

      SharedPreferences prefs= await SharedPreferences.getInstance();
      String? userid=prefs.getString('login_id');
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
        );
      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid login credentials'),
          ),
        );
      }
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
