import 'package:flutter/material.dart';

import '../constants/enums.dart';
import 'wrappers/double_animation_wrapper.dart';
import 'wrappers/single_animation_wrapper.dart';

class UiBoxFadeInAnimation extends StatelessWidget {
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
  final UiBoxFadeInVariant? variant;

  ///
  /// At which viewport the animation should start
  ///
  final double viewPort;

  ///
  /// Custom key for visibility widget
  ///
  final Key? visibilityKey;

  const UiBoxFadeInAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 350),
      this.delay = Duration.zero,
      this.viewPort = 0.1,
      this.variant,
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
                  opacity: value as double,
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
                    opacity: opacity,
                    child: child,
                  ));
            });
  }

  Offset getOffset(animation) {
    switch (variant) {
      case UiBoxFadeInVariant.fadeInTop:
      case UiBoxFadeInVariant.fadeInBottom:
        return Offset(0, animation);
      case UiBoxFadeInVariant.fadeInLeft:
      case UiBoxFadeInVariant.fadeInRight:
        return Offset(animation, 0);
      default:
        return const Offset(0, 0);
    }
  }

  Tween<double> getTween() {
    switch (variant) {
      case UiBoxFadeInVariant.fadeInTop:
        return Tween<double>(begin: initialPosition * 1, end: 0);
      case UiBoxFadeInVariant.fadeInBottom:
        return Tween<double>(begin: initialPosition * -1, end: 0);
      case UiBoxFadeInVariant.fadeInLeft:
        return Tween<double>(begin: initialPosition * 1, end: 0);
      case UiBoxFadeInVariant.fadeInRight:
        return Tween<double>(begin: initialPosition * -1, end: 0);
      default:
        return Tween<double>(begin: initialPosition * -1, end: 0);
    }
  }
}
