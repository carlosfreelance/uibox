import 'package:flutter/material.dart';
import '../animations/uibox_bounce_animation.dart';
import '../animations/uibox_fade_out_animation.dart';
import '../animations/uibox_flip_animation.dart';
import '../animations/uibox_slide_animation.dart';
import '../animations/uibox_zoom_animation.dart';
import '../animations/uibox_fade_in_animation.dart';
import '../constants/enums.dart';

extension AnimatioUiBoxension on Widget {
  Widget bounce(
      {Duration duration = const Duration(milliseconds: 350),
      Duration delay = Duration.zero,
      AnimationController? controller,
      bool startAnimation = true,
      double initialPosition = 100,
      bool loop = false,
      double viewPort = 0.1,
      UiBoxBounceVariant variant = UiBoxBounceVariant.bounceInLeft}) {
    return UiBoxBounceAnimation(
      duration: duration,
      delay: delay,
      viewPort: viewPort,
      controller: controller,
      initialPosition: initialPosition,
      startAnimation: startAnimation,
      variant: variant,
      child: this,
    );
  }

  Widget fadeIn(
      {Duration duration = const Duration(milliseconds: 350),
      Duration delay = Duration.zero,
      AnimationController? controller,
      bool startAnimation = true,
      bool loop = false,
      double viewPort = 0.1,
      double initialPosition = 100,
      UiBoxFadeInVariant variant = UiBoxFadeInVariant.fadeInLeft}) {
    return UiBoxFadeInAnimation(
      duration: duration,
      delay: delay,
      controller: controller,
      viewPort: viewPort,
      initialPosition: initialPosition,
      startAnimation: startAnimation,
      variant: variant,
      child: this,
    );
  }

  Widget fadeOut(
      {Duration duration = const Duration(milliseconds: 350),
      Duration delay = Duration.zero,
      AnimationController? controller,
      bool startAnimation = true,
      double initialPosition = 100,
      bool loop = false,
      double viewPort = 0.1,
      UiBoxFadeOutVariant variant = UiBoxFadeOutVariant.fadeOutLeft}) {
    return UiBoxFadeOutAnimation(
      duration: duration,
      delay: delay,
      controller: controller,
      viewPort: viewPort,
      initialPosition: initialPosition,
      startAnimation: startAnimation,
      variant: variant,
      child: this,
    );
  }

  Widget zoom(
      {Duration duration = const Duration(milliseconds: 350),
      Duration delay = Duration.zero,
      AnimationController? controller,
      bool startAnimation = true,
      bool loop = false,
      double viewPort = 0.1,
      double initialPosition = 1,
      UiBoxZoomVariant variant = UiBoxZoomVariant.zoomIn}) {
    return UiBoxZoomAnimation(
      duration: duration,
      delay: delay,
      viewPort: viewPort,
      controller: controller,
      initialPosition: initialPosition,
      startAnimation: startAnimation,
      variant: variant,
      child: this,
    );
  }

  Widget slide(
      {Duration duration = const Duration(milliseconds: 350),
      Duration delay = Duration.zero,
      AnimationController? controller,
      bool loop = false,
      double viewPort = 0.1,
      bool startAnimation = true,
      double initialPosition = 100,
      UiBoxSlideVariant variant = UiBoxSlideVariant.slideInLeft}) {
    return UiBoxSlideAnimation(
      duration: duration,
      delay: delay,
      controller: controller,
      initialPosition: initialPosition,
      startAnimation: startAnimation,
      viewPort: viewPort,
      variant: variant,
      child: this,
    );
  }

  Widget flip(
      {Duration duration = const Duration(milliseconds: 350),
      Duration delay = Duration.zero,
      AnimationController? controller,
      bool startAnimation = true,
      bool loop = false,
      double viewPort = 0.1,
      UiBoxFlipVariant variant = UiBoxFlipVariant.flipX}) {
    return UiBoxFlipAnimation(
      duration: duration,
      delay: delay,
      controller: controller,
      startAnimation: startAnimation,
      variant: variant,
      viewPort: viewPort,
      child: this,
    );
  }
}
