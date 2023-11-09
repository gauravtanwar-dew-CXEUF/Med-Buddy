import 'dart:convert';
import 'package:flutter/services.dart' show Color, rootBundle;

class DoctorType {
  final String type;
  final String icon;
  final Color backgroundColor;

  DoctorType({
    required this.type,
    required this.icon,
    required this.backgroundColor,
  });

  factory DoctorType.fromJson(Map<String, dynamic> json) {
    return DoctorType(
      type: json['type'],
      icon: json['icon'],
      backgroundColor: Color(int.parse(json['backgroundColor'].replaceAll('#', '0xFF'))),
    );
  }
}

class DoctorTypeService {
  List<DoctorType> doctorTypes = [];

  Future<void> loadDoctorTypesData() async {
    final String data = await rootBundle.loadString('assets/files/doctors_types.json');
    final List<dynamic> doctorTypesData = json.decode(data);

    doctorTypes = doctorTypesData.map((data) => DoctorType.fromJson(data)).toList();
  }
}
