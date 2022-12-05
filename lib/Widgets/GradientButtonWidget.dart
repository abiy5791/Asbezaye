import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GradientButtonWidget extends StatelessWidget {
  final double Vertical_Paddingsize;
  final double Horizontal_paddingsize;
  final String text;
  final double fontSize;
  final Color textColor;
  final double borderRadiusSize;
  final Color gradientColor1;
  final Color gradientColor2;
  final Alignment Begin_gradientAlignment;
  final Alignment End_gradientAlignment;
  GradientButtonWidget(
      {super.key,
      required this.text,
      required this.textColor,
      required this.gradientColor1,
      required this.gradientColor2,
      required this.fontSize,
      required this.borderRadiusSize,
      required this.Vertical_Paddingsize,
      required this.Horizontal_paddingsize,
      required this.Begin_gradientAlignment,
      required this.End_gradientAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Horizontal_paddingsize, vertical: Vertical_Paddingsize),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, color: textColor, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusSize),
        gradient: LinearGradient(
          colors: [
            gradientColor1,
            gradientColor2,
          ],
          begin: Begin_gradientAlignment,
          end: End_gradientAlignment,
        ),
      ),
    );
  }
}
