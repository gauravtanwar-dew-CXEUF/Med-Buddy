import 'package:flutter/material.dart';
import 'package:med_buddy/ui_screens/home_page.dart';
import 'package:med_buddy/widgets/center_content.dart';

import '../widgets/background_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    /*
    * Function to navigate screen*/
    navigatetoHomepage();
  }


  navigatetoHomepage() async{
    await Future.delayed(Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (_) => HomePage()));
  }
  
  
  
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: BackgroundPage(
        childWidget: CenterContent(),
      ),
    );

  }
}
