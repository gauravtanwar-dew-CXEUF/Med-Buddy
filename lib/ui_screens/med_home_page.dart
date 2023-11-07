import 'package:flutter/material.dart';

import '../widgets/daynamic_card.dart';


class MedHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Add the first banner loaded from the internet
          Container(
            height: 300, // Set the desired height for the banner
            child: Image.network(
              'https://img.freepik.com/free-vector/hospital-healthcare-service-sale-banner_23-2150394136.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1698969600&semt=ais', // Replace with the actual URL of the banner
              fit: BoxFit.cover,
            ),
          ),

          // Dynamic cards go here
          Expanded(
            child: ListView(
              children: [
                DynamicCard(
                  imagePath: 'assets/images/lab_test_img.png',
                  header: 'Book Lab Test',
                  description: 'Schedule a lab test appointment.',
                  onTap: () {
                    // Navigate to the lab test booking screen
                  },
                ),
                DynamicCard(
                  imagePath: 'assets/images/med_buy.jpeg',
                  header: 'Buy Medicines Online',
                  description: 'Order medicines online with delivery.',
                  onTap: () {
                    // Navigate to the online medicines screen
                  },
                ),
                DynamicCard(
                  imagePath: 'assets/images/doctor_img.jpeg',
                  header: "Book Doctor's Appointment",
                  description: 'Find and schedule an appointment with a doctor.',
                  onTap: () {
                    // Navigate to the doctor's appointment booking screen
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
