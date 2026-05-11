import 'package:flutter/material.dart';

class SizeReporter extends StatefulWidget {
  final Widget child;
  final Function(double height) onHeightChange;
  final double tolerance;
  final int framesToWait; // Cuántos frames esperar antes de medir

  const SizeReporter({
    required this.child,
    required this.onHeightChange,
    this.tolerance = 0.5,
    this.framesToWait = 2, // Esperar 2 frames completos
    Key? key,
  }) : super(key: key);

  @override
  _SizeReporterState createState() => _SizeReporterState();
}

class _SizeReporterState extends State<SizeReporter> {
  final GlobalKey _key = GlobalKey();
  double? _lastHeight;
  int _frameCount = 0;
  bool _isStable = false;

  @override
  void initState() {
    super.initState();
    _scheduleMeasurement();
  }

  @override
  void didUpdateWidget(covariant SizeReporter oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Resetear si el widget cambió
    _frameCount = 0;
    _isStable = false;
    _scheduleMeasurement();
  }

  void _scheduleMeasurement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _frameCount++;

      // Solo medir después de esperar los frames necesarios
      if (_frameCount >= widget.framesToWait) {
        _measureAndReport();
      } else {
        // Seguir esperando
        _scheduleMeasurement();
      }
    });
  }

  void _measureAndReport() {
    final context = _key.currentContext;
    if (context == null) return;

    final renderBox = context.findRenderObject();
    if (renderBox == null || renderBox is! RenderBox) return;

    final box = renderBox as RenderBox;

    // Verificar tamaño válido
    if (box.size.isEmpty || box.size.height <= 0) {
      // Si aún no tiene tamaño, reintentar
      _scheduleMeasurement();
      return;
    }

    final newHeight = box.size.height;

    // Solo reportar si cambió significativamente
    if (!_isStable ||
        (newHeight - (_lastHeight ?? 0)).abs() > widget.tolerance) {
      _lastHeight = newHeight;
      _isStable = true;

      widget.onHeightChange(newHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: _key, child: widget.child);
  }
}
