import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


Future<List<Map<String, dynamic>>?> loadMenuData() async {
  try {
    String jsonData = await rootBundle.loadString('assets/files/menu.json');
    return json.decode(jsonData).cast<Map<String, dynamic>>();
  } catch (e) {
    print("Error loading menu data: $e");
    return null;
  }
}

// Mapping icon names to Icons
IconData getIconForName(String iconName) {
  switch (iconName) {
    case 'home':
      return Icons.home;
    case 'doctors':
      return Icons.medical_services;
    case 'medicines':
      return Icons.medication;
    case 'flask':
      return Icons.science_rounded;
    case 'file-medical':
      return Icons.file_copy_rounded;
    default:
      return Icons.error; // You can change this to a default icon
  }
}
