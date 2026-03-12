import 'package:flutter/material.dart';
import 'package:uibox/src/widgets/uibox_responsive_value.dart';

import '../utils/screen_breakpoints.dart';

extension ResponsiveExtensions on BuildContext {
  // ═══════════════════════════════════════════════════════════
  // VALOR GENÉRICO RESPONSIVO
  // ═══════════════════════════════════════════════════════════
  T responsiveValue<T>({
    required T xs, // XS ahora es requerido como fallback
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
    T? xxxl,
    T? xl4k,
  }) {
    return UiBoxResponsiveValue.of<T>(
      this,
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // DOBLE (Padding, FontSize, etc.)
  // ═══════════════════════════════════════════════════════════
  double responsiveDouble({
    required double xs, // Requerido como fallback
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? xxxl,
    double? xl4k,
  }) {
    return responsiveValue<double>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // INT
  // ═══════════════════════════════════════════════════════════
  int responsiveInt({
    required int xs, // Requerido como fallback
    int? sm,
    int? md,
    int? lg,
    int? xl,
    int? xxl,
    int? xxxl,
    int? xl4k,
  }) {
    return responsiveValue<int>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget responsiveWidget({
    required Widget xs, // Requerido como fallback
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
    Widget? xxl,
    Widget? xxxl,
    Widget? xl4k,
  }) {
    return responsiveValue<Widget>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // EDGEPADDING
  // ═══════════════════════════════════════════════════════════
  EdgeInsets responsiveEdgeInsets({
    required EdgeInsets xs, // Requerido como fallback
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    EdgeInsets? xxl,
    EdgeInsets? xxxl,
    EdgeInsets? xl4k,
  }) {
    return responsiveValue<EdgeInsets>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // COLOR
  // ═══════════════════════════════════════════════════════════
  Color responsiveColor({
    required Color xs, // Requerido como fallback
    Color? sm,
    Color? md,
    Color? lg,
    Color? xl,
    Color? xxl,
    Color? xxxl,
    Color? xl4k,
  }) {
    return responsiveValue<Color>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // HELPERS EXISTENTES
  // ═══════════════════════════════════════════════════════════
  int get responsiveCrossAxisCount => ScreenBreakpoints.getCrossAxisCount(this);
  double get responsivePadding => ScreenBreakpoints.getPadding(this);
  double responsiveFontSize(double base) =>
      ScreenBreakpoints.getFontSize(this, base);
}
