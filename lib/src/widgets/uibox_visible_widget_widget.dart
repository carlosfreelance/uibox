import 'package:flutter/widgets.dart';

import '../utils/screen.dart';

class UiBoxVisibleWidget extends StatelessWidget {
  final bool? xs;
  final bool? sm;
  final bool? md;
  final bool? lg;
  final Widget? child;
  const UiBoxVisibleWidget({
    super.key,
    this.xs = true,
    this.sm = true,
    this.md = true,
    this.lg = true,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return switch (Screen.screenSize(context)) {
      ScreenSize.xs => xs! ? child! : const SizedBox.shrink(),
      ScreenSize.sm => sm! ? child! : const SizedBox.shrink(),
      ScreenSize.md => md! ? child! : const SizedBox.shrink(),
      ScreenSize.lg => lg! ? child! : const SizedBox.shrink(),
    };
  }
}
