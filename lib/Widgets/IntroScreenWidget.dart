import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroScreenWidget extends StatelessWidget {
  final String titleText;
  final String ImagePath;
  final String descriptionText;
  const IntroScreenWidget(
      {Key? key,
      required this.titleText,
      required this.ImagePath,
      required this.descriptionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.amber, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImagePath)),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          descriptionText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      )
    ]);
  }
}
