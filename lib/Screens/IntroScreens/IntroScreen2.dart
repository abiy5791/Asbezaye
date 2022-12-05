import 'package:asbezaye/Widgets/IntroScreenWidget.dart';
import 'package:flutter/material.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({ Key? key }) : super(key: key);

  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroScreenWidget(titleText: "ጥራት ያለው እቃ", ImagePath: "assets/images/Online Groceries (1).gif", descriptionText: "የ ፈለጉትን እቃ በፈለጉት ጥራት የሚያኙበት መተግበሪያ"),
    );
  }
}