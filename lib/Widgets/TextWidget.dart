import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextWidget extends StatelessWidget {
  final String text;
  double? fontSize;
  final Color textColor;
  final TextDecoration Textdecoration;

  TextWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.Textdecoration,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: Textdecoration,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
