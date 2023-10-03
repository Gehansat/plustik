import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const SignInButton({
    super.key, 
    required this.onTap,
    required this.text,
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
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          )),
    );
  }
}
