import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:button_navigation_bar/button_navigation_bar.dart';

/// Widget which can be used as a normal button, but is intended for use as a expandable button in a [ButtonNavigationBar]
class ButtonNavigationExpandable extends StatelessWidget {
  ButtonNavigationExpandable({
    this.label,
    this.icon,
    this.color,
    this.height,
    this.width,
    required this.onPressed,
  });

  /// The [label] defines the text inside of the button.
  final String? label;
  /// The icon inside of the button.
  final IconData? icon;
  /// The color of the button.
  final Color? color;
  /// Height of the button.
  final double? height;
  /// Width of the button.
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
