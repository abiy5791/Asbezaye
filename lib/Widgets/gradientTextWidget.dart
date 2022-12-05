import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GradientTextWidget extends StatelessWidget {
  final String TitleText;
  final double fontSize;
  final Color FirstGradientColor;
  final Color SecondGradientColor;
  final Color? ThirdGradientColor;
  final double? L;
  final double? T;
  final double? W;
  final double? H;

  const GradientTextWidget(
      {super.key,
      required this.TitleText,
      required this.fontSize,
      required this.FirstGradientColor,
      required this.SecondGradientColor,
      this.ThirdGradientColor,
      this.L,
      this.T,
      this.W,
      this.H});

  @override
  Widget build(BuildContext context) {
    return Text(
      TitleText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: <Color>[
              FirstGradientColor,
              SecondGradientColor,
            ],
          ).createShader(
            Rect.fromLTWH(L!, T!, W!, H!),
          ),
      ),
    );
  }
}
