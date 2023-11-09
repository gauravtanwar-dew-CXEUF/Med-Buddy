import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:med_buddy/widgets/doctors_types_tiles.dart';

import '../model/load_doctors_type.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  DoctorTypeService _doctorTypeService = DoctorTypeService();

  @override
  void initState() {
    super.initState();
    _loadDoctorTypesData();
  }

  Future<void> _loadDoctorTypesData() async {
    await _doctorTypeService.loadDoctorTypesData();
    if (mounted) {
      setState(() {}); // Update the UI to display the doctor type tiles.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _doctorTypeService.doctorTypes.isNotEmpty
          ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two tiles per row
          childAspectRatio: 1.0, // 1:1 aspect ratio for square tiles
          mainAxisSpacing: 16.0, // Add vertical spacing between tiles
          crossAxisSpacing: 16.0, // Add horizontal spacing between tiles
        ),
        itemCount: _doctorTypeService.doctorTypes.length,
        itemBuilder: (context, index) {
          final doctorType = _doctorTypeService.doctorTypes[index];
          return GestureDetector(
            onTap: () {
              // Handle the tile click, e.g., navigate to a page related to the selected doctor type.
            },
            child: Card(
              elevation: 2, // Elevation for the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Add a radius to the card
                side: BorderSide(
                  color: Colors.black.withOpacity(0.2), // Dark border color
                  width: 2.0, // Border width
                ),
              ),
              color: doctorType.backgroundColor, // Background color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital_outlined, size: 48, color: Colors.white), // You can use a custom icon or the icon from the doctor type data.
                  Text(
                    doctorType.type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(), // Show loading indicator while data is being loaded.
      ),
    );
  }
}