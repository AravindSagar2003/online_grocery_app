import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_grocery_app_ui/routes/routename.dart';
import 'package:online_grocery_app_ui/viewmodels/signin_view_model.dart';
import 'package:online_grocery_app_ui/views/signupScreen.dart';
import 'package:online_grocery_app_ui/utils/helper.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key, this.zone, this.area});
  final String? zone;
  final String? area;

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  bool obscure_text = true;

  String? error;
  String? errorpass;

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              Image.asset('asset/images/carrot_color.png'),
              SizedBox(height: 80),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff181725),
                        fontSize: ht / 34.59,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your email and password',
                      style: TextStyle(color: Color(0xff7C7C7C), fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 35),
                  TextField(
                    controller: email_controller,
                    decoration: InputDecoration(labelText: 'Email', errorText: error),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 35),
                  TextField(
                    obscureText: obscure_text,
                    controller: password_controller,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: errorpass,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure_text ? Icons.visibility : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            obscure_text = !obscure_text;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 30),
                  Consumer<SignInViewModel>(
                    builder: (context, viewModel, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fixedSize: Size(364, 67),
                          backgroundColor: Color(0xff53B175),
                        ),
                        onPressed: () {
                          // Validate email and password
                          error = validateEmail(value: email_controller.text);
                          errorpass = validatePassword(password: password_controller.text);
                          setState(() {});

                          // If no validation errors, proceed to login
                          if (error == null && errorpass == null) {
                            print('lohgeeen');
                            viewModel.login(
                              email: email_controller.text,
                              password: password_controller.text,
                              context: context,
                            );
                          }
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(color: Colors.green),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signupscreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
