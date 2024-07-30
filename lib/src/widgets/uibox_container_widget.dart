import 'package:flutter/material.dart';
import '../../uibox.dart';

///
/// Implementation of the Bootstrap .container and .container-fluid
///
class UiBoxContainer extends StatelessWidget {
  const UiBoxContainer({
    Key? key,
    this.alignment = Alignment.topCenter,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.fluid = false,
    this.decoration,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  ///
  /// Is the container fluid => if yes, takes the whole width
  /// Default value: false
  ///
  final bool fluid;

  ///
  /// Box Decoration to the widget
  ///
  final BoxDecoration? decoration;

  ///
  /// List of childrens
  ///
  final List<Widget> children;

  ///
  /// Padding
  ///
  final EdgeInsets padding;

  ///
  /// Alignment of children
  ///
  final Alignment alignment;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: Align(
          alignment: alignment,
          child: Container(
            decoration: decoration,
            padding: padding,
            width: fluid
                ? context.screenWidth
                : context.getMaxWidthForNonFluid(context.screenWidth),
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ),
      );
    });
  }
}
