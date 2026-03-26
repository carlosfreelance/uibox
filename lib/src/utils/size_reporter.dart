import 'package:flutter/material.dart';

class SizeReporter extends StatefulWidget {
  final Widget child;
  final Function(double height) onHeightChange;
  final double tolerance; // Margen de error en píxeles

  const SizeReporter({
    required this.child,
    required this.onHeightChange,
    this.tolerance = 0.5, // Ignora cambios menores a 0.5px
    Key? key,
  }) : super(key: key);

  @override
  State<SizeReporter> createState() => _SizeReporterState();
}

class _SizeReporterState extends State<SizeReporter> {
  final GlobalKey _key = GlobalKey();
  double? _lastHeight;
  bool _hasMeasured = false;

  @override
  void initState() {
    super.initState();
    // Medir después del primer frame
    WidgetsBinding.instance.addPostFrameCallback(_measureAndReport);
  }

  @override
  void didUpdateWidget(covariant SizeReporter oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Solo volver a medir si el widget cambió
    WidgetsBinding.instance.addPostFrameCallback(_measureAndReport);
  }

  void _measureAndReport(_) {
    final context = _key.currentContext;
    if (context == null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final newHeight = renderBox.size.height;

    // Solo reportar si es la primera vez o si cambió significativamente
    if (!_hasMeasured ||
        (newHeight - (_lastHeight ?? 0)).abs() > widget.tolerance) {
      _lastHeight = newHeight;
      _hasMeasured = true;

      // Notificar al padre
      widget.onHeightChange(newHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: _key, child: widget.child);
  }
}
