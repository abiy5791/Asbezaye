import 'package:flutter/material.dart';

class NormalTextWidget extends StatelessWidget {
  String text;
  Color? textColor;
  double textFontSize;
  FontWeight? textfontWeight;
  NormalTextWidget(
      {required this.text,
      this.textColor,
      required this.textFontSize,
      this.textfontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: textFontSize, color: textColor, fontWeight: textfontWeight),
    );
  }
}
