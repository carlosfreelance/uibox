import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class UiBoxAnimator {
  static Widget fade({
    Widget? child,
    RxBool? status,
    int? duration,
  }) {
    return VisibilityDetector(
      key: Key(uuid.v4()),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          status!.value = true;
        } else {
          status!.value = false;
        }
      },
      child: Obx(
        () => AnimatedOpacity(
            opacity: status!.value ? 1.0 : 0.0,
            duration: Duration(milliseconds: duration!),
            child: child),
      ),
    );
  }

  static Widget fadeInRight({
    Widget? child,
    RxBool? status,
    int? duration,
    double? distance = 300,
  }) {
    return VisibilityDetector(
      key: Key(uuid.v4()),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          status!.value = true;
        } else {
          status!.value = false;
        }
      },
      child: Obx(
        () => AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: duration!),
          transform: Matrix4.translationValues(status!.value ? 0 : 300, 0, 0),
          child: AnimatedOpacity(
              opacity: status.value ? 1.0 : 0.0,
              duration: Duration(milliseconds: duration),
              child: child), // add
        ),
      ),
    );
  }

  static Widget fadeInLeft({
    Widget? child,
    RxBool? status,
    int? duration,
    double? distance = 300,
  }) {
    return VisibilityDetector(
      key: Key(uuid.v4()),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          status!.value = true;
        } else {
          status!.value = false;
        }
      },
      child: Obx(
        () => AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: duration!),
          transform: Matrix4.translationValues(
              status!.value ? 0 : double.parse("-$distance"), 0, 0),
          child: AnimatedOpacity(
              opacity: status.value ? 1.0 : 0.0,
              duration: Duration(milliseconds: duration),
              child: child), // add
        ),
      ),
    );
  }

  static Widget fadeInTop({
    Widget? child,
    RxBool? status,
    int? duration,
    double? distance = 300,
  }) {
    return VisibilityDetector(
      key: Key(uuid.v4()),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          status!.value = true;
        } else {
          status!.value = false;
        }
      },
      child: Obx(
        () => AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: duration!),
          transform: Matrix4.translationValues(
              0, status!.value ? 0 : double.parse("-$distance"), 0),
          child: AnimatedOpacity(
              opacity: status.value ? 1.0 : 0.0,
              duration: Duration(milliseconds: duration),
              child: child), // add
        ),
      ),
    );
  }

  static Widget fadeInBottom({
    Widget? child,
    RxBool? status,
    int? duration,
    double? distance = 300,
  }) {
    return VisibilityDetector(
      key: Key(uuid.v4()),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          status!.value = true;
        } else {
          status!.value = false;
        }
      },
      child: Obx(
        () => AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: duration!),
          transform:
              Matrix4.translationValues(0, status!.value ? 0 : distance!, 0),
          child: AnimatedOpacity(
              opacity: status.value ? 1.0 : 0.0,
              duration: Duration(milliseconds: duration),
              child: child), // add
        ),
      ),
    );
  }
}
