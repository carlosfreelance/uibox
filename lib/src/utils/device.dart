import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'screen.dart';

// Device utils
mixin class Device {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);

  static Future<bool> isLaptop(BuildContext context) async {
    return await deviceType(context) == DeviceType.laptop;
  }

  static Future<bool> isTablet(BuildContext context) async {
    return await deviceType(context) == DeviceType.tablet;
  }

  static Future<bool> isMobile(BuildContext context) async {
    return await deviceType(context) == DeviceType.mobile;
  }

  static bool get isWeb => kIsWeb;

  static bool get isWindows => GetPlatform.isWindows;
  static bool get isLinux => GetPlatform.isLinux;
  static bool get isMacOS => GetPlatform.isMacOS;
  static bool get isAndroid => GetPlatform.isAndroid;
  static bool get isFuchsia => GetPlatform.isFuchsia;
  static bool get isIOS => GetPlatform.isIOS;

  /// Get @DeviceType
  /// @DeviceType.MOBILE
  /// @DeviceType.TABLET
  /// @DeviceType.LAPTOP
  /// @DeviceType.TV
  /// @TVDeviceType.unknown
  static Future<DeviceType> deviceType(BuildContext context) async {
    final screenSize = Screen.screenSize(context);
    if (isWeb) {
      if (isWindows || isLinux || isMacOS) {
        return DeviceType.laptop;
      } else if (screenSize == ScreenSize.xs) {
        return DeviceType.mobile;
      } else if (screenSize == ScreenSize.sm) {
        return DeviceType.tablet;
      } else if (screenSize == ScreenSize.md) {
        return DeviceType.laptop;
      } else if (screenSize == ScreenSize.lg) {
        return DeviceType.tv;
      } else {
        return DeviceType.unknown;
      }
    } else if (isDesktop) {
      return DeviceType.laptop;
    } else if (isAndroid || isIOS) {
      if (screenSize == ScreenSize.xs) {
        return DeviceType.mobile;
      } else if (screenSize == ScreenSize.sm) {
        return DeviceType.tablet;
      } else if (screenSize == ScreenSize.md || screenSize == ScreenSize.lg) {
        return DeviceType.tv;
      } else {
        return DeviceType.unknown;
      }
    } else {
      return DeviceType.unknown;
    }
  }
}

/// @DeviceType
enum DeviceType { mobile, tablet, laptop, tv, unknown }

/// @TVDeviceType
enum TVDeviceType { tizen, webos, androidtv, firetv, mitv, unknown }
