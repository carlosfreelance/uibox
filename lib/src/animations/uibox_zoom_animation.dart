import 'package:flutter/material.dart';

import '../constants/enums.dart';
import 'wrappers/double_animation_wrapper.dart';

class UiBoxZoomAnimation extends StatelessWidget {
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
  final UiBoxZoomVariant? variant;

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

  const UiBoxZoomAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 350),
      this.delay = Duration.zero,
      this.variant = UiBoxZoomVariant.zoomIn,
      this.controller,
      this.viewPort = 0.1,
      this.startAnimation = true,
      this.initialPosition = 1,
      this.visibilityKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoubleAnimationWrapper(
        viewPort: viewPort,
        controller: controller,
        duration: duration,
        firstAnimation: (controller) => getTween().animate(
            CurvedAnimation(curve: Curves.easeOut, parent: controller)),
        startAnimation: startAnimation,
        secondAnimation: (controller) => getOpacityTween().animate(
            CurvedAnimation(parent: controller, curve: const Interval(0, 0.7))),
        child: (AnimationController controller, dynamic animation,
            dynamic opacity) {
          return Transform.scale(
              scale: animation,
              child: Opacity(
                opacity: opacity,
                child: child,
              ));
        });
  }

  Tween<double> getTween() {
    switch (variant) {
      case UiBoxZoomVariant.zoomIn:
        return Tween(begin: 0.0, end: initialPosition);
      case UiBoxZoomVariant.zoomOut:
        return Tween(begin: 1.0, end: initialPosition);
      default:
        return Tween(begin: 0.0, end: 1.0);
    }
  }

  Tween<double> getOpacityTween() {
    switch (variant) {
      case UiBoxZoomVariant.zoomIn:
        return Tween<double>(begin: 0.0, end: 1.0);
      case UiBoxZoomVariant.zoomOut:
        return Tween<double>(begin: 1.0, end: 0.0);
      default:
        return Tween<double>(begin: 0.0, end: 1.0);
    }
  }
}
