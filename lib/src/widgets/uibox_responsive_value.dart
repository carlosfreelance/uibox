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
    return _getValueForSize(screenSize) ?? _getFallbackValue();
  }

  /// Obtiene el valor para un tamaño específico
  T _getValueForSize(ScreenSize size) {
    switch (size) {
      case ScreenSize.xs:
        return xs ?? sm ?? md ?? lg ?? xl ?? xxl ?? xxxl ?? xl4k!;
      case ScreenSize.sm:
        return sm ?? xs ?? md ?? lg ?? xl ?? xxl ?? xxxl ?? xl4k!;
      case ScreenSize.md:
        return md ?? sm ?? xs ?? lg ?? xl ?? xxl ?? xxxl ?? xl4k!;
      case ScreenSize.lg:
        return lg ?? md ?? sm ?? xs ?? xl ?? xxl ?? xxxl ?? xl4k!;
      case ScreenSize.xl:
        return xl ?? lg ?? md ?? sm ?? xs ?? xxl ?? xxxl ?? xl4k!;
      case ScreenSize.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxxl ?? xl4k!;
      case ScreenSize.xxxl:
        return xxxl ?? xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xl4k!;
      case ScreenSize.xl_4k:
        return xl4k ?? xxxl ?? xxl ?? xl ?? lg ?? md ?? sm ?? xs!;
    }
  }

  /// Valor fallback por defecto (si todo es null)
  T _getFallbackValue() {
    // Intenta devolver el primer valor no null en orden de prioridad
    if (xs != null) return xs as T;
    if (sm != null) return sm as T;
    if (md != null) return md as T;
    if (lg != null) return lg as T;
    if (xl != null) return xl as T;
    if (xxl != null) return xxl as T;
    if (xxxl != null) return xxxl as T;
    if (xl4k != null) return xl4k as T;

    // Si todo es null, lanza error o devuelve valor por defecto
    throw Exception('ResponsiveValue: Todos los valores son null');
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
}
