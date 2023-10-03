import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plustik/components/login/login_textfield.dart';
import 'package:plustik/components/login/sign_in_out_button.dart';
import 'package:plustik/components/login/squre_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Sign in function
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign up

    try {
      if (passwordController.text == confirmPasswordController.text) {
        final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Set the user's display name
        await userCredential.user?.updateDisplayName(nameController.text);
        // hide loading circle if success
        Navigator.pop(context);
        
      } else {
        // show error message, password doesn't match
        showErrorMessage("Password doesn't match");
        Navigator.pop(context);
      }

      // hide loading circle if success
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // hide loading circle if error
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  // Wrong email message
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 13),
              ),
            ),
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
                  height: 45,
                ),
                Image.asset(
                  "assets/logo.png",
                  scale: 1.8,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 10),
                  child: Text(
                    "Create your account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 10),
                // Login Fields

                // Name
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        LoginTextField(
                          controller: nameController,
                          hintText: "Enter your name",
                          obscureText: false,
                        ),
                      ]),
                ),

                // Email
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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

                // Password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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

                // Confirm Password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        LoginTextField(
                          controller: confirmPasswordController,
                          hintText: "Confirm your password",
                          obscureText: true,
                        ),
                      ]),
                ),

                const SizedBox(
                  height: 30,
                ),

                // Sign Up Button
                SignInButton(
                  text: "SIGN UP",
                  onTap: signUserUp,
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

                const SizedBox(
                  height: 15,
                ),

                // Dont have account - REGISTER
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account?",
                        style:
                            TextStyle(color: Color(0xff888888), fontSize: 14)),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("SIGN IN",
                            style: TextStyle(color: Color(0xff00B140)))),
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
