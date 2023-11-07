import 'package:flutter/material.dart';
import 'package:med_buddy/ui_screens/doctor_page.dart';
import 'package:med_buddy/ui_screens/health_record_page.dart';
import 'package:med_buddy/ui_screens/lab_tests_page.dart';
import 'package:med_buddy/ui_screens/med_home_page.dart';
import 'package:med_buddy/ui_screens/medicines_page.dart';
import '../model/loadmenudata.dart';
import '../widgets/custom_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>>? menuData;
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadMenuData().then((data) {
      setState(() {
        menuData = data;
      });
    });
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: CustomHeader(
              userName: 'Amelia',
              userPhotoUrl: 'https://buffer.com/library/content/images/size/w1000/2022/03/sigmund-MQ2xYBHImKM-unsplash--1--1.jpg',
              tagline: 'Welcome to our app!',
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                MedHomePage(),
                DoctorsPage(),
                MedicinesPage(),
                LabTestPage(),
                HealthRecordPage(),
              ],
              onPageChanged: _onPageChanged,
            ),
          ),
        ],
      ),
      bottomNavigationBar: menuData == null
          ? CircularProgressIndicator()
          : BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        currentIndex: currentIndex,
        onTap: _onTabTapped,
        items: menuData!.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(getIconForName(item['icon'])),
            label: item['title'],
          );
        }).toList(),
      ),
    );
  }
}
