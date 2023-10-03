import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plustik/components/login/login_textfield.dart';
import 'package:plustik/components/login/signin_button.dart';
import 'package:plustik/components/login/squre_tile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign in function
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // hide loading circle if success
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // hide loading circle if error
      Navigator.pop(context);

      if (e.code == 'invalid-email') {
        // Wrong email
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        // Wrong password
        wrongPasswordMessage();
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        wrongPwdEmailMessage();
      }
    }
  }

  // Wrong email message
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wrong email"),
            content: const Text("The email you entered is not registered"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  // Wrong password message
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Wrong password"),
            content: const Text("The password you entered is incorrect"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        }
    );
  }

  // handle common error
    void wrongPwdEmailMessage() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Wrong email or password"),
              content: const Text("The email or password you entered is incorrect. Please try again."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          }
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/logo.png",
                  scale: 1.2,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 15),
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
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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

                const SizedBox(
                  height: 15,
                ),

                // Dont have account - REGISTER
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style:
                            TextStyle(color: Color(0xff888888), fontSize: 14)),
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
      ),
    );
  }
}
