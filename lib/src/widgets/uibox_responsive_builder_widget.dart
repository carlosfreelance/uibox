// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../utils/device.dart';

class UiBoxResponsiveDevice extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const UiBoxResponsiveDevice(
      {super.key, this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Device.deviceType(context),
        builder: (BuildContext context, AsyncSnapshot<DeviceType> snapshot) {
          return switch (snapshot.data) {
            DeviceType.mobile => mobile!,
            DeviceType.tablet => tablet!,
            DeviceType.laptop => desktop!,
            DeviceType.tv => desktop!,
            _ => desktop!,
          };
        });
  }
}
