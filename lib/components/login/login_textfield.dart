import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 141, 145, 143),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // text area hieight
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // Adjust the radius as needed
              borderSide: BorderSide(color: Color(0xffFAFAFA), width: 0)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // Adjust the radius as needed
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 141, 145, 143), width: 0)),
          fillColor: const Color(0xffFAFAFA),
          filled: true,
          ),
    );
  }
}
