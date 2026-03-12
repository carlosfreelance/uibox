import 'package:flutter/material.dart';
import '../utils/screen_breakpoints.dart';

/// Clase genérica para devolver valores responsivos según el breakpoint
class UiBoxResponsiveValue<T> {
  final T? xs;
  final T? sm;
  final T? md;
  final T? lg;
  final T? xl;
  final T? xxl;
  final T? xxxl;
  final T? xl4k;

  /// Constructor: al menos un valor debe ser proporcionado
  const UiBoxResponsiveValue({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.xxxl,
    this.xl4k,
  });

  /// Obtiene el valor según el tamaño de pantalla actual
  T getValue(BuildContext context) {
    final screenSize = ScreenBreakpoints.getScreenSize(context);
    final value = _getValueForSize(screenSize);

    if (value == null) {
      throw Exception(
        'ResponsiveValue: Debes proporcionar al menos un valor no nulo',
      );
    }

    return value;
  }

  /// Obtiene el valor para un tamaño específico con fallback inteligente
  T? _getValueForSize(ScreenSize size) {
    switch (size) {
      case ScreenSize.xs:
        return xs ?? sm ?? md ?? lg ?? xl ?? xxl ?? xxxl ?? xl4k;
      case ScreenSize.sm:
        return sm ?? xs ?? md ?? lg ?? xl ?? xxl ?? xxxl ?? xl4k;
      case ScreenSize.md:
        return md ?? sm ?? xs ?? lg ?? xl ?? xxl ?? xxxl ?? xl4k;
      case ScreenSize.lg:
        return lg ?? md ?? sm ?? xs ?? xl ?? xxl ?? xxxl ?? xl4k;
      case ScreenSize.xl:
        return xl ?? lg ?? md ?? sm ?? xs ?? xxl ?? xxxl ?? xl4k;
      case ScreenSize.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxxl ?? xl4k;
      case ScreenSize.xxxl:
        return xxxl ?? xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xl4k;
      case ScreenSize.xl_4k:
        return xl4k ?? xxxl ?? xxl ?? xl ?? lg ?? md ?? sm ?? xs;
    }
  }

  /// Método estático conveniente para usar directamente en el build
  static T of<T>(
    BuildContext context, {
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
    T? xxxl,
    T? xl4k,
  }) {
    return UiBoxResponsiveValue<T>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    ).getValue(context);
  }

  /// Método con valor por defecto (no lanza error si todo es null)
  static T ofOrDefault<T>(
    BuildContext context,
    T defaultValue, {
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
    T? xxxl,
    T? xl4k,
  }) {
    final value = UiBoxResponsiveValue<T>(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
      xxl: xxl,
      xxxl: xxxl,
      xl4k: xl4k,
    )._getValueForSize(ScreenBreakpoints.getScreenSize(context));

    return value ?? defaultValue;
  }
}
