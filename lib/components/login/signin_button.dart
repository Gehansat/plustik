import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Function()? onTap;

  const SignInButton({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff00B140)),
          child: const Center(
            child: Text("SIGN IN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          )),
    );
  }
}
