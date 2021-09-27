import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonNavigationExpandable extends StatelessWidget {
  ButtonNavigationExpandable({
    this.label,
    this.icon,
    this.color,
    this.height,
    this.width,
    required this.onPressed,
  });

  final String? label;
  final IconData? icon;
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  Widget _childBuilder(IconData? icon, String? label) {
    if (icon != null && label != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text(label)
        ],
      );
    } else if (icon != null) {
      return Icon(icon);
    } else if (label != null) {
      return Text(label);
    } else {
      return SizedBox.shrink();
    }
  }

  ButtonStyle? _buttonStyle(Color? color) {
    if (color != null) {
      ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(color),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle(color),
        child: _childBuilder(icon, label),
      ),
    );
  }
}
