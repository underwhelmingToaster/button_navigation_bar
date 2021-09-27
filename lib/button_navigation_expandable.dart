import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonNavigationExpandable extends StatelessWidget {
  ButtonNavigationExpandable({
    this.label,
    this.icon,
    this.color,
    this.height = 40,
    this.width = 72,
    required this.onPressed,
  });

  final String? label;
  final IconData? icon;
  final Color? color;
  final double height;
  final double width;
  final VoidCallback onPressed;

  Widget childBuilder(IconData? icon, String? label) {
    if (icon != null && label != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(label)],
      );
    } else if (icon != null) {
      return Icon(icon);
    } else if (label != null) {
      return Text(label);
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: childBuilder(icon, label),
      ),
    );
  }
}