import 'package:flutter/material.dart';

import '../constants/enums.dart';
import 'wrappers/single_animation_wrapper.dart';

class UiBoxSlideAnimation extends StatelessWidget {
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
  final UiBoxSlideVariant? variant;

  ///
  /// At which viewport the animation should start
  ///
  final double viewPort;

  ///
  /// Custom key for visibility widget
  ///
  final Key? visibilityKey;

  ///
  /// Initial position from where it needs to begin
  ///
  final double initialPosition;

  const UiBoxSlideAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 350),
      this.delay = Duration.zero,
      this.variant = UiBoxSlideVariant.slideInLeft,
      this.controller,
      this.viewPort = 0.1,
      this.startAnimation = true,
      this.initialPosition = 100,
      this.visibilityKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleAnimationWrapper(
        viewPort: viewPort,
        duration: duration,
        startAnimation: startAnimation,
        delay: delay,
        controller: controller,
        child: (controller, value) {
          return Transform.translate(
            offset: getOffset(value),
            child: child,
          );
        },
        animation: (controller) => getTween().animate(
            CurvedAnimation(parent: controller, curve: Curves.easeOut)));
  }

  Offset getOffset(animation) {
    switch (variant) {
      case UiBoxSlideVariant.slideInTop:
        return Offset(0, animation);
      case UiBoxSlideVariant.slideInBottom:
        return Offset(0, animation);
      case UiBoxSlideVariant.slideInLeft:
      case UiBoxSlideVariant.slideInRight:
        return Offset(animation, 0);
      default:
        return const Offset(0, 0);
    }
  }

  Tween<double> getTween() {
    switch (variant) {
      case UiBoxSlideVariant.slideInTop:
        return Tween<double>(begin: initialPosition, end: 0);
      case UiBoxSlideVariant.slideInBottom:
        return Tween<double>(begin: initialPosition * -1, end: 0);
      case UiBoxSlideVariant.slideInLeft:
        return Tween<double>(begin: initialPosition * -1, end: 0);
      case UiBoxSlideVariant.slideInRight:
        return Tween<double>(begin: initialPosition, end: 0);
      default:
        return Tween<double>(begin: initialPosition * -1, end: 0);
    }
  }
}
