import 'package:flutter/material.dart';
import '../../uibox.dart';

///
/// Implementation of the Bootstrap .container and .container-fluid
///
class UiBoxSizedBox extends StatelessWidget {
  const UiBoxSizedBox({
    Key? key,
    required this.child,
    this.fluid = false,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final bool fluid;
  final Widget child;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: Container(
            padding: padding,
            width: fluid
                ? context.screenWidth
                : context.getMaxWidthForNonFluid(context.screenWidth),
            child: child),
      );
    });
  }
}
