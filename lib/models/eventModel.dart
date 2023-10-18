import 'package:flutter/material.dart';

class Event {
  final String eventName;
  final DateTime dateTime;
  final String venue;
  final String category;

  Event({
    required this.eventName,
    required this.dateTime,
    required this.venue,
    required this.category,
  });
}