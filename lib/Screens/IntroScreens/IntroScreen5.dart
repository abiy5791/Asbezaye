import 'package:asbezaye/Widgets/IntroScreenWidget.dart';
import 'package:flutter/material.dart';

class IntroScreen5 extends StatefulWidget {
  const IntroScreen5({ Key? key }) : super(key: key);

  @override
  _IntroScreen5State createState() => _IntroScreen5State();
}

class _IntroScreen5State extends State<IntroScreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: IntroScreenWidget(titleText: "ዘመናዊነት", ImagePath: "assets/images/Online Groceries-rafiki.png", descriptionText: "የ አስቤዛዬ መተግበሪያን በመጠቀም ህይወትዎን ያቅሉ"),
    );
  }
}