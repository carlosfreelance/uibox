import 'package:flutter/material.dart';

class UiBoxOptimizedEqualHeightWrap extends StatefulWidget {
  final List<Widget> children;
  final double verticalSpacing;
  final double horizontalSpacing;
  final VerticalDirection verticalDirection;
  final WrapCrossAlignment crossAxisAlignment;
  final WrapAlignment horizontalAlignment;
  final WrapAlignment verticalAlignment;

  const UiBoxOptimizedEqualHeightWrap({
    super.key,
    required this.children,
    this.horizontalSpacing = 20.0,
    this.verticalSpacing = 20.0,
    this.verticalDirection = VerticalDirection.down,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.horizontalAlignment = WrapAlignment.start,
    this.verticalAlignment = WrapAlignment.start,
  });

  @override
  State<UiBoxOptimizedEqualHeightWrap> createState() =>
      _UiBoxOptimizedEqualHeightWrapState();
}

class _UiBoxOptimizedEqualHeightWrapState
    extends State<UiBoxOptimizedEqualHeightWrap> {
  final GlobalKey _wrapKey = GlobalKey();
  final ValueNotifier<double> _maxHeightNotifier = ValueNotifier(0.0);
  bool _isFirstLayout = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureAndUpdate();
    });
  }

  void _measureAndUpdate() {
    final renderBox = _wrapKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    double maxHeight = 0;
    renderBox.visitChildren((child) {
      if (child is RenderBox) {
        maxHeight = maxHeight > child.size.height
            ? maxHeight
            : child.size.height;
      }
    });

    if (_maxHeightNotifier.value != maxHeight) {
      _maxHeightNotifier.value = maxHeight;
      _isFirstLayout = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Widget invisible para medición
        Opacity(
          opacity: _isFirstLayout ? 1.0 : 0.0,
          child: IgnorePointer(
            child: Wrap(
              key: _wrapKey,
              runSpacing: widget.verticalSpacing,
              spacing: widget.horizontalSpacing,
              children: widget.children,
            ),
          ),
        ),
        // Widget visible con alturas igualadas
        if (!_isFirstLayout)
          ValueListenableBuilder<double>(
            valueListenable: _maxHeightNotifier,
            builder: (context, maxHeight, _) {
              return Wrap(
                crossAxisAlignment: widget.crossAxisAlignment,
                runSpacing: widget.verticalSpacing,
                spacing: widget.horizontalSpacing,
                verticalDirection: widget.verticalDirection,
                alignment: widget.horizontalAlignment,
                runAlignment: widget.verticalAlignment,
                children: widget.children.map((child) {
                  return SizedBox(height: maxHeight, child: child);
                }).toList(),
              );
            },
          ),
      ],
    );
  }

  @override
  void dispose() {
    _maxHeightNotifier.dispose();
    super.dispose();
  }
}
