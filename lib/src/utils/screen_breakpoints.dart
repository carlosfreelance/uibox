import 'package:flutter/material.dart';

/// Enum con TODOS los tamaños de pantalla (de XS a 4XL)
enum ScreenSize { xs, sm, md, lg, xl, xxl, xxxl, xl_4k }

/// Clase utilitaria para manejar breakpoints responsivos avanzados
class ScreenBreakpoints {
  // ═══════════════════════════════════════════════════════════
  // BREAKPOINTS ACTUALIZADOS (en píxeles de ancho)
  // ═══════════════════════════════════════════════════════════
  static const double xsMax = 380; // Móviles muy pequeños
  static const double smMax = 600; // Móviles pequeños
  static const double mdMax = 840; // Móviles grandes / Phablets
  static const double lgMax = 1100; // Tablets pequeñas
  static const double xlMax = 1400; // Tablets grandes / Laptop 13"
  static const double xxlMax = 1920; // Desktop Estándar (Full HD)
  static const double xxxlMax = 2560; // Desktop Grande (2K / QHD / Mac 27")
  // > 2560 = 4XL (4K / Ultrawide / Mac Studio)

  // ═══════════════════════════════════════════════════════════
  // OBTENER TAMAÑO ACTUAL
  // ═══════════════════════════════════════════════════════════
  static ScreenSize getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < xsMax) return ScreenSize.xs;
    if (width < smMax) return ScreenSize.sm;
    if (width < mdMax) return ScreenSize.md;
    if (width < lgMax) return ScreenSize.lg;
    if (width < xlMax) return ScreenSize.xl;
    if (width < xxlMax) return ScreenSize.xxl;
    if (width < xxxlMax) return ScreenSize.xxxl;
    return ScreenSize.xl_4k;
  }

  // ═══════════════════════════════════════════════════════════
  // MÉTODOS DE CONSULTA INDIVIDUAL
  // ═══════════════════════════════════════════════════════════
  static bool isXS(BuildContext context) =>
      getScreenSize(context) == ScreenSize.xs;
  static bool isSM(BuildContext context) =>
      getScreenSize(context) == ScreenSize.sm;
  static bool isMD(BuildContext context) =>
      getScreenSize(context) == ScreenSize.md;
  static bool isLG(BuildContext context) =>
      getScreenSize(context) == ScreenSize.lg;
  static bool isXL(BuildContext context) =>
      getScreenSize(context) == ScreenSize.xl;
  static bool isXXL(BuildContext context) =>
      getScreenSize(context) == ScreenSize.xxl;
  static bool isXXXL(BuildContext context) =>
      getScreenSize(context) == ScreenSize.xxxl;
  static bool is4K(BuildContext context) =>
      getScreenSize(context) == ScreenSize.xl_4k;

  // ═══════════════════════════════════════════════════════════
  // MÉTODOS AGRUPADOS
  // ═══════════════════════════════════════════════════════════
  static bool isMobile(BuildContext context) {
    final size = getScreenSize(context);
    return size == ScreenSize.xs ||
        size == ScreenSize.sm ||
        size == ScreenSize.md;
  }

  static bool isTablet(BuildContext context) {
    final size = getScreenSize(context);
    return size == ScreenSize.lg || size == ScreenSize.xl;
  }

  static bool isDesktop(BuildContext context) {
    final size = getScreenSize(context);
    return size == ScreenSize.xxl ||
        size == ScreenSize.xxxl ||
        size == ScreenSize.xl_4k;
  }

  static bool isLargeDesktop(BuildContext context) {
    final size = getScreenSize(context);
    return size == ScreenSize.xxxl || size == ScreenSize.xl_4k;
  }

  // ═══════════════════════════════════════════════════════════
  // VALORES RESPONSIVOS (Padding, Font, Grid)
  // ═══════════════════════════════════════════════════════════
  static double getPadding(BuildContext context) {
    final size = getScreenSize(context);
    switch (size) {
      case ScreenSize.xs:
        return 12.0;
      case ScreenSize.sm:
        return 16.0;
      case ScreenSize.md:
        return 20.0;
      case ScreenSize.lg:
        return 24.0;
      case ScreenSize.xl:
        return 32.0;
      case ScreenSize.xxl:
        return 48.0;
      case ScreenSize.xxxl:
        return 64.0;
      case ScreenSize.xl_4k:
        return 80.0;
    }
  }

  static double getFontSize(BuildContext context, double baseSize) {
    final size = getScreenSize(context);
    switch (size) {
      case ScreenSize.xs:
        return baseSize * 0.85;
      case ScreenSize.sm:
        return baseSize * 0.90;
      case ScreenSize.md:
        return baseSize * 0.95;
      case ScreenSize.lg:
        return baseSize;
      case ScreenSize.xl:
        return baseSize * 1.10;
      case ScreenSize.xxl:
        return baseSize * 1.20;
      case ScreenSize.xxxl:
        return baseSize * 1.35;
      case ScreenSize.xl_4k:
        return baseSize * 1.50;
    }
  }

  static int getCrossAxisCount(BuildContext context) {
    final size = getScreenSize(context);
    switch (size) {
      case ScreenSize.xs:
        return 2;
      case ScreenSize.sm:
        return 2;
      case ScreenSize.md:
        return 3;
      case ScreenSize.lg:
        return 4;
      case ScreenSize.xl:
        return 5;
      case ScreenSize.xxl:
        return 6;
      case ScreenSize.xxxl:
        return 8;
      case ScreenSize.xl_4k:
        return 10;
    }
  }

  // ═══════════════════════════════════════════════════════════
  // ANCHO MÁXIMO DE CONTENIDO (CONTAINER WIDTH)
  // ═══════════════════════════════════════════════════════════
  /// Evita que el contenido se estire demasiado en pantallas 4K
  static double getMaxContentWidth(BuildContext context) {
    final size = getScreenSize(context);
    switch (size) {
      case ScreenSize.xs:
        return 350;
      case ScreenSize.sm:
        return 550;
      case ScreenSize.md:
        return 750;
      case ScreenSize.lg:
        return 950;
      case ScreenSize.xl:
        return 1200;
      case ScreenSize.xxl:
        return 1400;
      case ScreenSize.xxxl:
        return 1800;
      case ScreenSize.xl_4k:
        return 2200; // O usar null para ancho completo
    }
  }
}
