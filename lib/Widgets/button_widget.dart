import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;
  bool HaveIcon;
  final IconData? icon;
  Color? iconColor;
  final String? btnText;
  Color? TextColor;
  final double? fontSize;
  Color ContainerColor;
  final double? borderRadius;
  ButtonWidget(
      {Key? key,
      required this.horizontalPadding,
      required this.verticalPadding,
      required this.ContainerColor,
      this.iconColor,
      required this.HaveIcon,
      this.TextColor,
      this.icon,
      this.btnText,
      this.fontSize,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool ThereisanIcon = HaveIcon;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: ThereisanIcon
          ? Icon(icon,color: iconColor,)
          : Text(
              btnText!,
              style: TextStyle(
                  color: TextColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
            ),
      decoration: BoxDecoration(
        color: ContainerColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
    );
  }
}
