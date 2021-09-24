library button_navigation_bar;

import 'package:button_navigation_bar/src/animationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The  [ButtonNavigationBar] is the menu bar, in which [ButtonNavigationItem] get inserted.
///
/// Mainly used instead of [FloatingActionButton] (FAB) in a [Scaffold], but can be used in other scenarios as well.
/// When using this as a FAB, you might want to center it using "floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat",
///
/// In [children] one can insert multiple [ButtonNavigationItem], which will be the elements of the menu bar.
/// [padding] allows to set a padding around the menu bar. Not recommended when using Widget as FAB.
/// [spaceBetweenItems] allows customisation of gap between buttons.
/// [borderRadius] is used to define ounding the four edges. A few examples:
///   - To round all four edges:
///       borderRadius: BorderRadius.all(Radius.circular(10))
///   - Set edges individually:
///       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.elliptical(3, 9)
///   - No edges:
///       borderRadius: BorderRadius.zero

class ButtonNavigationBar extends StatefulWidget {
  final List<ButtonNavigationItem> children;
  final EdgeInsets padding;
  final double spaceBetweenItems;
  final BorderRadius borderRadius;

  ButtonNavigationBar(
      {required this.children,
      this.padding = EdgeInsets.zero,
      this.spaceBetweenItems = 1.5,
      this.borderRadius = const BorderRadius.all(Radius.circular(16))});

  @override
  _ButtonNavigationBarState createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  /// Builds the content inside of the button, depending on if [icon] and [label] have been supplied.
  Widget childBuilder(Icon? icon, String? label) {
    if (icon != null && label != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, Text(label)],
      );
    } else if (icon != null) {
      return icon;
    } else if (label != null) {
      return Text(label);
    } else {
      return SizedBox.shrink();
    }
  }

  /// Gives the outer left- and right buttons the edges, which have been set using [ButtonNavigationBar.borderRadius]
  BorderRadius borderBuilder(int position) {
    if (position == 0) {
      return BorderRadius.only(
          bottomLeft: widget.borderRadius.bottomLeft,
          topLeft: widget.borderRadius.topLeft);
    } else if (position == widget.children.length - 1) {
      return BorderRadius.only(
          bottomRight: widget.borderRadius.bottomRight,
          topRight: widget.borderRadius.topRight);
    } else {
      return BorderRadius.zero;
    }
  }

  /// Checks if [item] is a expandable button and returns a [SizedBox].
  /// SizedBox contains a [ElevatedButton] when [item] doesn't have any children.
  /// SizedBox contains a [ExpandableRowChildButton] when [item] has children.
  SizedBox rowChild(ButtonNavigationItem item, int position) {
    VoidCallback? onPressed;
    if (item.children != null) {
      /// When the item has children, it is a expandable button ([ButtonNavigationItem.expandable]).
      return SizedBox(
        child: ExpandableRowChildButton(
          distance: 100.0,
          children: [
            Text("lol"),
            Text("lol"),
          ],
        ),
      );
    } else {
      return buildRowChildButton(item, position);
    }
  }

  SizedBox buildRowChildButton(ButtonNavigationItem item, int position) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: item.onPressed,
        child: childBuilder(Icon(item.icon), item.label),
        style: ElevatedButton.styleFrom(
          primary: item.color,
          shape:
              new RoundedRectangleBorder(borderRadius: borderBuilder(position)),
        ),
      ),
      height: item.height,
      width: item.width,
    );
  }

  /// Adds the [rowChild] in one row to be passed to the row widget in [build]
  List<Widget> rowChildren(List<ButtonNavigationItem> children) {
    List<Widget> rowChildren = new List.empty(growable: true);
    for (int i = 0; i < children.length; i++) {
      rowChildren.add(rowChild(children[i], i));
      if (i != children.length - 1) {
        rowChildren.add(Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widget.spaceBetweenItems)));
      }
    }
    return rowChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rowChildren(widget.children),
      ),
    );
  }
}

/// A ButtonNavigationItem represents one button in the menu bar. Should be inserted in [ButtonNavigationBar.children].
///
/// The [label] is the text displayed on the button. If empty, no text is displayed on the button.
/// [icon] displays a passed Icon of the label text.
/// [color] sets the color of the button. Buttons in the same menu can have different colors.
/// [height] and [width] set the dimensions of the button. If left emtpy, height is 48 and with 72.
/// [onPressed] sets the action of the button when pressed.

class ButtonNavigationItem {
  final String? label;
  final IconData? icon;
  final Color? color;
  final double height;
  final double width;
  final VoidCallback? onPressed;
  final List<ButtonNavigationExpandable>? children;

  ButtonNavigationItem({
    this.label,
    this.icon,
    this.color,
    this.height = 48,
    this.width = 72,
    required this.onPressed,
  }) : children = null;

  ButtonNavigationItem.expandable({
    this.label,
    this.icon,
    this.color,
    this.height = 48,
    this.width = 72,
    required this.children,
  }) : onPressed = null;
}

class ButtonNavigationExpandable {
  ButtonNavigationExpandable({
    this.label,
    this.icon,
    this.color,
    this.height = 48,
    this.width = 72,
    required this.onPressed,
  });

  final String? label;
  final IconData? icon;
  final Color? color;
  final double height;
  final double width;
  final VoidCallback onPressed;
}
