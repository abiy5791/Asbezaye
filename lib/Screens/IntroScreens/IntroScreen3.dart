import 'package:asbezaye/Widgets/IntroScreenWidget.dart';
import 'package:flutter/material.dart';

class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({ Key? key }) : super(key: key);

  @override
  _IntroScreen3State createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: IntroScreenWidget(titleText: "ቀላል ያከፋፈል ዘዴ", ImagePath: "assets/images/Online Groceries (2).gif", descriptionText: "የ ተለያዩ የ ክፍያ አማራጮች ያሉት"),
    );
  }
}