import 'package:flutter/material.dart';

import '../constants/enums.dart';
import 'wrappers/double_animation_wrapper.dart';

class UiBoxFlipAnimation extends StatelessWidget {
  ///
  /// Child widget
  ///
  final Widget child;

  ///
  /// Duration of animation
  ///
  final Duration duration;

  ///
  /// Start animation after an delay
  ///
  final Duration delay;

  ///
  /// Add an controller to control animation
  ///
  final AnimationController? controller;

  ///
  /// if value is true, animation will be started immediately
  ///
  final bool startAnimation;

  ///
  /// Provide variant type
  ///
  final UiBoxFlipVariant? variant;

  ///
  /// At which viewport the animation should start
  ///
  final double viewPort;

  ///
  /// Custom key for visibility widget
  ///
  final Key? visibilityKey;

  const UiBoxFlipAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 350),
      this.delay = Duration.zero,
      this.controller,
      this.viewPort = 0.1,
      this.startAnimation = true,
      this.variant = UiBoxFlipVariant.flipX,
      this.visibilityKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoubleAnimationWrapper(
      viewPort: viewPort,
      duration: duration,
      startAnimation: startAnimation,
      delay: delay,
      controller: controller,
      firstAnimation: (controller) => Tween<double>(begin: 1.5, end: 0.0)
          .animate(
              CurvedAnimation(parent: controller, curve: Curves.bounceOut)),
      secondAnimation: (controller) => Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0, 0.7))),
      child: (controller, first, second) {
        return Transform(
            alignment: FractionalOffset.center,
            transform: variant == UiBoxFlipVariant.flipY
                ? (Matrix4.identity()..rotateX(first as double))
                : (Matrix4.identity()..rotateY(first as double)),
            child: Opacity(
              opacity: second as double,
              child: child,
            ));
      },
    );
  }
}
