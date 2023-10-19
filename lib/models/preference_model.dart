import 'package:flutter/material.dart';

class PreferenceModel {
  bool GlobEvents;
  bool LocEvents;
  bool Shramadhana;
  bool Workshops;
  bool Recycling;

  PreferenceModel({
    this.GlobEvents = false,
    this.LocEvents = false,
    this.Shramadhana = false,
    this.Workshops = false,
    this.Recycling = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'GlobEvents': GlobEvents,
      'LocEvents': LocEvents,
      'Shramadhana': Shramadhana,
      'Workshops': Workshops,
      'Recycling': Recycling,
    };
  }

  factory PreferenceModel.fromJson(Map<String, dynamic> json) {
    return PreferenceModel(
      GlobEvents: json['GlobEvents'] ?? false,
      LocEvents: json['LocEvents'] ?? false,
      Shramadhana: json['Shramadhana'] ?? false,
      Workshops: json['Workshops'] ?? false,
      Recycling: json['Recycling'] ?? false,
    );
  }
}