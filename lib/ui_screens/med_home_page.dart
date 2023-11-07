import 'package:flutter/material.dart';
import '../widgets/daynamic_card.dart';


class MedHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DynamicCard(
              imagePath: 'assets/images/lab_test_image.png',
              header: 'Book Lab Test',
              description: 'Schedule a lab test appointment.',
              onTap: () {
                // Navigate to the lab test booking screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LabTestScreen()),
                // );
              },
            ),
            DynamicCard(
              imagePath: 'assets/images/lab_test_image.png',
              header: 'Buy Medicines Online',
              description: 'Order medicines online with delivery.',
              onTap: () {
                // Navigate to the online medicines screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MedicinesScreen()),
                // );
              },
            ),
            DynamicCard(
              imagePath: 'assets/images/lab_test_image.png',
              header: "Book Doctor's Appointment",
              description: 'Find and schedule an appointment with a doctor.',
              onTap: () {
                // Navigate to the doctor's appointment booking screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DoctorAppointmentScreen()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
