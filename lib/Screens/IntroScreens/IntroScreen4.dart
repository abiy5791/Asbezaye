import 'package:asbezaye/Widgets/IntroScreenWidget.dart';
import 'package:flutter/material.dart';

class IntroScreen4 extends StatefulWidget {
  const IntroScreen4({ Key? key }) : super(key: key);

  @override
  _IntroScreen4State createState() => _IntroScreen4State();
}

class _IntroScreen4State extends State<IntroScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: IntroScreenWidget(titleText: "ቤትዎ ድረስ ማድረስ", ImagePath: "assets/images/In no time (1).gif", descriptionText: "ያዘዙትን አቃ ቤትዎ ድረስ በፍጥነት አና በታማኘነት አናደረሳለን"),
    );
  }
}