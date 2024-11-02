import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/viewmodels/signin_view_model.dart';
import 'package:online_grocery_app_ui/views/bottomnavigationbar.dart';
import 'package:provider/provider.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'asset/images/sing.png',
              width: wt,
              height: ht / 2.40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get your groceries\nwith nectar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ht / 34.59,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Email input field
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        
                        /// Password input field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),

                        /// Phone number input field (optional)
                        PhoneFormField(
                          initialValue: PhoneNumber.parse('+91'),
                          countrySelectorNavigator:
                              const CountrySelectorNavigator.page(),
                          onChanged: (phoneNumber) =>
                              print('changed into $phoneNumber'),
                          enabled: true,
                          isCountrySelectionEnabled: true,
                          isCountryButtonPersistent: true,
                          countryButtonStyle: const CountryButtonStyle(
                            showDialCode: true,
                            showIsoCode: true,
                            showFlag: true,
                            flagSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  Center(
                    child: Text(
                      'Or connect with social media',
                      style: TextStyle(color: Color(0xff828282)),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Google Sign-In button
                  Consumer<SignInViewModel>(
                    builder: (context, viewModel, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5383EC),
                          fixedSize: Size(364, 67),
                        ),
                        onPressed: () async {
                          await viewModel.googleSignIn();
                          if (viewModel.user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bottomnavigationbar(),
                              ),
                            );
                          } else if (viewModel.errorMessage.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(viewModel.errorMessage)),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'asset/images/googleicon.png',
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Continue with Google',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 20),

                  // Login button
                  Consumer<SignInViewModel>(
                    builder: (context, viewModel, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(364, 67),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await viewModel.login(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context,
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 20),

                  // Facebook Sign-In button (placeholder for future functionality)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(364, 67),
                      backgroundColor: Color(0xff4A66AC),
                    ),
                    onPressed: () {
                      // TODO: Implement Facebook sign-in
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'asset/images/facebookicon.png',
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
