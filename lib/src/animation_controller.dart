import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:button_navigation_bar/src/builder.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

@immutable
class ExpandableRowChildButton extends StatefulWidget {
  const ExpandableRowChildButton({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
    required this.position,
    required this.navBarLength,
    required this.borderRadius,
    required this.item,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;
  final int position;
  final int navBarLength;
  final BorderRadius borderRadius;
  final ButtonNavigationItem item;

  @override
  _ExpandableRowChildButtonState createState() =>
      _ExpandableRowChildButtonState();
}

class _ExpandableRowChildButtonState extends State<ExpandableRowChildButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(widget.item, widget.position, widget.navBarLength,
              widget.borderRadius),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(widget.item, widget.position, widget.navBarLength,
              widget.borderRadius),
        ],
      ),
    );
  }

  /// Builds the button which gets displayed when the expandable button gets clicked. Clicking this button will close the expandable again.
  Widget _buildTapToCloseFab(ButtonNavigationItem item, int position, int navBarLength, BorderRadius borderRadius) {
    ButtonNavigationItem? collapseButton = item.collapseButton;
    if(collapseButton == null) {
      collapseButton = new ButtonNavigationItem(onPressed: _toggle, icon: Icons.close); // Defining the default collapse button
    } else {
      collapseButton = new ButtonNavigationItem(onPressed: _toggle, icon: collapseButton.icon, color: collapseButton.color, width: collapseButton.width, height: collapseButton.height, label: collapseButton.label); // Overriding the onPressed parameter
    }
    return NavBarBuilder().buildRowChildButton(collapseButton, position, navBarLength, borderRadius);
  }

  /// Builds the Buttons that are displayed when the [ButtonNavigationItem.expandable] gets clicked.
  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = widget.item.expandableSpacing;
    for (var i = 0;
        i < count;
        i++) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: 90,
          maxDistance: widget.distance + i * step,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  /// Builds the expandable button.
  ///  Note that this same button doesn't close the expandable again. For this purpose, the [_buildTapToCloseFab] button is used.
  Widget _buildTapToOpenFab(ButtonNavigationItem item, int position,
      int navBarLength, BorderRadius borderRadius) {
    ButtonNavigationItem expandableItem = ButtonNavigationItem(
        onPressed: _toggle,
        icon: item.icon,
        label: item.label,
        color: item.color,
        height: item.height,
        width: item.width);
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: NavBarBuilder().buildRowChildButton(
              expandableItem, position, navBarLength, borderRadius),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
