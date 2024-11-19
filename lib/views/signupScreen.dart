import 'package:flutter/material.dart';
import 'package:online_grocery_app_ui/viewmodels/signin_view_model.dart';
import 'package:online_grocery_app_ui/views/homeScreen.dart';
import 'package:provider/provider.dart';

import 'loginScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  bool obscureText = true;

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
              SizedBox(height: 60),
              Image.asset('asset/images/carrot_color.png'),
              SizedBox(height: 60),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
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
                      'Enter your credentials to continue',
                      style: TextStyle(
                        color: Color(0xff7C7C7C),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 35),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 35),
                  TextField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: TextStyle(color: Colors.black12, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(color: Colors.black12, fontSize: 14),
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: Size(364, 67),
                      backgroundColor: Color(0xff53B175),
                    ),
                    onPressed: () {
                      final signInViewModel =
                          Provider.of<SignInViewModel>(context, listen: false);
                      signInViewModel.register(
                        name: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginscreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ), 
                        ),
                      ),
                    ],
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
