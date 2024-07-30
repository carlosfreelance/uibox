import 'package:flutter/widgets.dart';
import 'package:responsiveness/responsiveness.dart';

class UiBoxResponsiveParent extends StatelessWidget {
  final Widget? child;

  ///the callback used to wrap the given [child] with another [Widget] for screen sizes >= 0
  final Widget? xs;

  ///the callback used to wrap the given [child] with another [Widget] for screen sizes >= 576
  final Widget? sm;

  ///the callback used to wrap the given [child] with another [Widget] for screen sizes >= 768
  final Widget? md;

  ///the callback used to wrap the given [child] with another [Widget] for screen sizes >= 992
  final Widget? lg;

  ///the callback used to wrap the given [child] with another [Widget] for screen sizes >= 1200
  final Widget? xl;

  ///the callback used to wrap the given [child] with another [Widget] for screen sizes >= 1400
  final Widget? xxl;
  const UiBoxResponsiveParent({
    super.key,
    required this.child,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveParent<List<Widget>>(
      xs: (child) => xs!,
      md: (child) => md!,
      lg: (child) => lg!,
      xl: (child) => xl!,
      xxl: (child) => xxl!,
      child: [], //some children Widgets
    );
  }
}
