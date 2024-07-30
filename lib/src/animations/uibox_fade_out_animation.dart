import 'package:flutter/material.dart';
import 'package:uibox/src/constants/enums.dart';

import 'wrappers/double_animation_wrapper.dart';
import 'wrappers/single_animation_wrapper.dart';

class UiBoxFadeOutAnimation extends StatelessWidget {
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
  /// Initial position from where it needs to begin
  ///
  final double initialPosition;

  ///
  /// Provide variant type
  ///
  final UiBoxFadeOutVariant? variant;

  ///
  /// At which viewport the animation should start
  ///
  final double viewPort;

  ///
  /// Custom key for visibility widget
  ///
  final Key? visibilityKey;

  const UiBoxFadeOutAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 350),
      this.delay = Duration.zero,
      this.variant,
      this.viewPort = 0.1,
      this.controller,
      this.startAnimation = true,
      this.initialPosition = 100,
      this.visibilityKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return variant == null
        ? SingleAnimationWrapper(
            viewPort: viewPort,
            child: (controller, value) => AnimatedOpacity(
                  opacity: 1 - (value as double),
                  duration: duration,
                  child: child,
                ),
            animation: (controller) =>
                CurvedAnimation(curve: Curves.easeOut, parent: controller))
        : DoubleAnimationWrapper(
            viewPort: viewPort,
            controller: controller,
            duration: duration,
            firstAnimation: (controller) => getTween().animate(
                CurvedAnimation(parent: controller, curve: Curves.easeOut)),
            startAnimation: startAnimation,
            secondAnimation: (controller) => Tween<double>(begin: 0, end: 1)
                .animate(CurvedAnimation(
                    parent: controller, curve: const Interval(0, 0.7))),
            child: (AnimationController controller, dynamic animation,
                dynamic opacity) {
              return Transform.translate(
                  offset: getOffset(animation),
                  child: Opacity(
                    opacity: (1 - opacity).toDouble(),
                    child: child,
                  ));
            });
  }

  Offset getOffset(animation) {
    switch (variant) {
      case UiBoxFadeOutVariant.fadeOutTop:
      case UiBoxFadeOutVariant.fadeOutBottom:
        return Offset(0, animation);
      case UiBoxFadeOutVariant.fadeOutLeft:
      case UiBoxFadeOutVariant.fadeOutRight:
        return Offset(animation, 0);
      default:
        return const Offset(0, 0);
    }
  }

  Tween<double> getTween() {
    switch (variant) {
      case UiBoxFadeOutVariant.fadeOutTop:
        return Tween<double>(end: initialPosition * 1, begin: 0);
      case UiBoxFadeOutVariant.fadeOutBottom:
        return Tween<double>(end: initialPosition * -1, begin: 0);
      case UiBoxFadeOutVariant.fadeOutLeft:
        return Tween<double>(end: initialPosition * -1, begin: 0);
      case UiBoxFadeOutVariant.fadeOutRight:
        return Tween<double>(end: initialPosition, begin: 0);
      default:
        return Tween<double>(end: initialPosition * -1, begin: 0);
    }
  }
}
