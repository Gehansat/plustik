import 'package:flutter/material.dart';

class Appointment {
final DateTime dateTime;
  final String contactNo;
  final String email;
  final String instructions;
  // final List<String> wasteTypes; // List of waste types

  Appointment({
    required this.dateTime,
    required this.contactNo,
    required this.email,
    required this.instructions,
    // required this.wasteTypes, // Include the list of waste types
  });

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'contactNo': contactNo,
      'email': email,
      'instructions': instructions,
      // 'wasteTypes': wasteTypes,
    };
  }
}
