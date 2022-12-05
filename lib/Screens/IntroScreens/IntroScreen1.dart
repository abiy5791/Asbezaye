import 'package:asbezaye/Widgets/IntroScreenWidget.dart';
import 'package:flutter/material.dart';

class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  _IntroScreen1State createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.white,
      body: IntroScreenWidget(
          titleText: "ላጠቃቀም ቀላል",
          ImagePath: "assets/images/Online Groceries.gif",
          descriptionText: "ለቤትዎ የሚፈልጉትን አስቤዛ በቀላሉ በስልክዎ ማዘዝ ይችላሉ"),
    );
  }
}
