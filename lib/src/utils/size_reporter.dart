import 'package:flutter/material.dart';

class SizeReporter extends StatefulWidget {
  final Widget child;
  final ValueChanged<double> onHeightChange; // ValueChanged es más idiomático
  final double tolerance;

  const SizeReporter({
    required this.child,
    required this.onHeightChange,
    this.tolerance = 0.5,
    Key? key,
  }) : super(key: key);

  @override
  State<SizeReporter> createState() => _SizeReporterState();
}

class _SizeReporterState extends State<SizeReporter> {
  final GlobalKey _key = GlobalKey();
  double? _lastHeight;

  @override
  void initState() {
    super.initState();
    _scheduleMeasurement();
  }

  @override
  void didUpdateWidget(covariant SizeReporter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      _scheduleMeasurement();
    }
  }

  void _scheduleMeasurement() {
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (!mounted) return;
      _measureAndReport();
    });
  }

  void _measureAndReport() {
    final context = _key.currentContext;
    if (context == null) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return;

    final size = renderBox.size;
    if (size.isEmpty || size.height <= 0) {
      // Reintentar si aún no hay tamaño válido
      _scheduleMeasurement();
      return;
    }

    final newHeight = size.height;
    final lastHeight = _lastHeight;

    if (lastHeight == null ||
        (newHeight - lastHeight).abs() > widget.tolerance) {
      _lastHeight = newHeight;
      widget.onHeightChange(newHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      width: double.infinity, // Evita colapso horizontal
      child: widget.child,
    );
  }
}
