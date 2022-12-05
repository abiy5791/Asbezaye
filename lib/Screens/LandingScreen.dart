import 'dart:async';
import 'package:asbezaye/Screens/HomeScreen.dart';
import 'package:asbezaye/Screens/IntroScreens/IntroScreen1.dart';
import 'package:asbezaye/Screens/IntroScreens/IntroScreen3.dart';
import 'package:asbezaye/Screens/IntroScreens/IntroScreen4.dart';
import 'package:asbezaye/Screens/IntroScreens/IntroScreen5.dart';
import 'package:asbezaye/Screens/SplashScreen.dart';
import 'package:asbezaye/Widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'IntroScreens/IntroScreen2.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  PageController _controller = PageController();
  bool onlastPage = false;
  bool onfirsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onlastPage = (index == 4);
                onfirsPage = (index == 0);
              });
            },
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
              IntroScreen4(),
              IntroScreen5(),
            ],
          ),
          Positioned(
              top: 15,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(4);
                  Timer(
                      Duration(milliseconds: 500),
                      () => Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: HomeScreen(),
                              type: PageTransitionType.fade)));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
          Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: onfirsPage
                      ? Text("")
                      : ButtonWidget(
                          horizontalPadding: 10,
                          verticalPadding: 5,
                          ContainerColor: Colors.transparent,
                          HaveIcon: true,
                          icon: Icons.arrow_back,
                          iconColor: Colors.amber,
                          btnText: "",
                          borderRadius: 10,
                        ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: WormEffect(
                      activeDotColor: Colors.amber,
                      dotWidth: 10,
                      dotHeight: 10),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: onlastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: HomeScreen(),
                                  type: PageTransitionType.fade),
                            );
                          },
                          child: ButtonWidget(
                            horizontalPadding: 10,
                            verticalPadding: 5,
                            ContainerColor: Colors.transparent,
                            HaveIcon: false,
                            btnText: "Done",
                            TextColor: Colors.amber,
                            borderRadius: 10,
                          ),
                        )
                      : ButtonWidget(
                          horizontalPadding: 10,
                          verticalPadding: 5,
                          ContainerColor: Colors.transparent,
                          HaveIcon: true,
                          icon: Icons.arrow_forward,
                          iconColor: Colors.amber,
                          btnText: "",
                          borderRadius: 10,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
