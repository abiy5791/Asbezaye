import 'dart:async';
import 'package:asbezaye/Routes/routes.dart';
import 'package:asbezaye/Screens/LandingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingScreen(), type: PageTransitionType.rightToLeft)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                  "assets/logo/Grey & Green Elegant Minimal Good Taste Food Restaurant Logo.gif"),
            ),
          ),
        ),
      ),
    );
  }
}
