import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_grocery_app_ui/utils/api_constants.dart';

class ApiService {
  // Function to register a user
  Future<void> registerUser({
    required String name,
    required String password,
    required String email,
  }) async {
    final String url = '$baseurl/registration/';

    // Prepare the registration data
    final Map<String, String> registrationData = {
      'name': name,
      'password': password,
      'email': email,
    };

    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(registrationData), // Convert body to JSON format
        headers: {
          'Content-Type': 'application/json', // Specify JSON content-type
        },
      );

      if (response.statusCode == 201) {
        print('Registration successful: ${response.body}');
      } else {
        String message = jsonDecode(response.body)['message'] ?? 'An error occurred';
        throw Exception(message);
      }
    } catch (e) {
      print('Error during registration: $e');
      rethrow;
    }
  }

  // Function to log in a user
  Future<Map<String, dynamic>> loginUser({
    required String password,
    required String email,
  }) async {
    final String url = '$baseurl/login/';

    // Prepare the login data
    final Map<String, String> loginData = {
      'password': password,
      'email': email,
    };

    try {
      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(loginData), // Convert body to JSON format
        headers: {
          'Content-Type': 'application/json', // Specify JSON content-type
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['data'] ?? {}; // Return user data as a map
      } else {
        String message = jsonDecode(response.body)['message'] ?? 'Failed to login';
        throw Exception(message);
      }
    } catch (e) {
      print('Error during login: $e');
      rethrow;
    }
  }
}
