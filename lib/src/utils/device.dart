import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

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

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;

  /// Get @DeviceType
  /// @DeviceType.MOBILE
  /// @DeviceType.TABLET
  /// @DeviceType.LAPTOP
  /// @DeviceType.TV
  /// @TVDeviceType.unknown
  static Future<DeviceType> deviceType(BuildContext context) async {
    final screenSize = Screen.screenSize(context);
    if (isWeb) {
      final appVersion = html.window.navigator.appVersion.toUpperCase();
      if (appVersion.contains('TIZEN') ||
          appVersion.contains('WEBOS') ||
          appVersion.contains('BOX') ||
          appVersion.contains('TV')) {
        return DeviceType.tv;
      } else if (isWindows || isLinux || isMacOS) {
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
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        final model = androidInfo.model.toUpperCase();
        if (model.contains('AFT') ||
            model.contains('BOX') ||
            model.contains('TV')) {
          return DeviceType.tv;
        }
      } else if (isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        debugPrint(iosInfo.toString());
      }
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

  /// Get @TVDeviceType
  /// @TVDeviceType.tizen
  /// @TVDeviceType.webos
  /// @TVDeviceType.androidtv
  /// @TVDeviceType.firetv
  /// @TVDeviceType.mitv
  /// @TVDeviceType.unknown
  static Future<TVDeviceType> tvDeviceType(BuildContext context) async {
    final deviceType = await Device.deviceType(context);
    if (deviceType == DeviceType.tv) {
      if (isWeb) {
        final appVersion = html.window.navigator.appVersion.toUpperCase();
        if (appVersion.contains('TIZEN')) {
          return TVDeviceType.tizen;
        } else if (appVersion.contains('WEBOS')) {
          return TVDeviceType.webos;
        }
      } else if (isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        if (isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          final model = androidInfo.model.toUpperCase();
          if (model.contains('AFT')) {
            return TVDeviceType.firetv;
          } else if (model.contains('BOX')) {
            return TVDeviceType.mitv;
          } else if (model.contains('TV')) {
            return TVDeviceType.androidtv;
          }
        }
      }
    }
    return TVDeviceType.unknown;
  }
}

/// @DeviceType
enum DeviceType {
  mobile,
  tablet,
  laptop,
  tv,
  unknown,
}

/// @TVDeviceType
enum TVDeviceType {
  tizen,
  webos,
  androidtv,
  firetv,
  mitv,
  unknown,
}
