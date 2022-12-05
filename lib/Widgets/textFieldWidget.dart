import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Color? hintColor;
  final Color? InputColor;
  final String? labelText;
  final Color? labelColor;
  final Color NormalborderColor;
  final Color FocusborderColor;
  final double BorderRadiusSize;
  final TextInputType? keyboardtype;
  bool obscureText;

  final TextEditingController? controller;

  TextFieldWidget(
      {super.key,
      this.keyboardtype,
      required this.obscureText,
      required this.hintText,
      this.hintColor = Colors.black38,
      required this.labelText,
      this.labelColor = Colors.black,
      this.BorderRadiusSize = 10,
      this.NormalborderColor = Colors.black,
      this.FocusborderColor = Colors.green,
      this.InputColor,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      style: TextStyle(
        color: InputColor,
      ),
      keyboardType: keyboardtype,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: NormalborderColor,
          ),
          borderRadius: BorderRadius.circular(BorderRadiusSize),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: FocusborderColor)),
      ),
    );
  }
}
