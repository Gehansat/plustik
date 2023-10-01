import 'package:flutter/material.dart';
import 'package:plustik/components/login/login_textfield.dart';
import 'package:plustik/components/login/signin_button.dart';
import 'package:plustik/components/login/squre_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign in function
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/logo.png",
                scale: 1.2,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  "Sign Into Your Account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              // Login Fields

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      LoginTextField(
                        controller: emailController,
                        hintText: "Enter your email",
                        obscureText: false,
                      ),
                    ]),
              ),

              const SizedBox(
                height: 20,
              ),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      LoginTextField(
                        controller: passwordController,
                        hintText: "Enter your password",
                        obscureText: true,
                      ),
                    ]),
              ),

              const SizedBox(
                height: 35,
              ),

              // Sign In Button
              SignInButton(
                onTap: signUserIn,
              ),

              // Divider and Text
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                  ],
                ),
              ),

              // Google Sign In Button
              const SqureTile(imagePath: "assets/google.png"),

              const SizedBox(height: 15,),

              // Dont have account - REGISTER
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?" , style: TextStyle(color: Color(0xff888888), fontSize: 14)),
                  SizedBox(
                    width: 4,
                  ),
                  Text("SIGN UP", style: TextStyle(color: Color(0xff00B140))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
