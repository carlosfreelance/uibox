import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart' as io;

class UiBoxHoverWidget extends StatefulWidget {
  ///
  /// [Duration] for returning back to original state
  ///
  final Duration hoverDuration;

  ///
  /// Builder for showing how the widget should be in hover or unhovered state
  ///
  final Widget Function(BuildContext context, bool isHovered) builder;
  const UiBoxHoverWidget(
      {Key? key,
      required this.builder,
      this.hoverDuration = const Duration(milliseconds: 1200)})
      : super(key: key);

  @override
  State<UiBoxHoverWidget> createState() => _UiBoxHoverWidgetState();
}

class _UiBoxHoverWidgetState extends State<UiBoxHoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return io.Platform.isAndroid || io.Platform.isIOS
        ? GestureDetector(
            onPanCancel: () {
              Future.delayed(widget.hoverDuration).then((_) {
                if (isHovered && mounted) {
                  setState(() {
                    isHovered = false;
                  });
                }
              });
            },
            onPanDown: (_) {
              setState(() {
                isHovered = true;
              });
            },
            child: widget.builder(context, isHovered),
          )
        : MouseRegion(
            onEnter: (event) {
              if (!isHovered) {
                setState(() {
                  isHovered = true;
                });
              }
            },
            onExit: (PointerExitEvent event) {
              if (isHovered) {
                setState(() {
                  isHovered = false;
                });
              }
            },
            onHover: (p) {
              if (!isHovered) {
                setState(() {
                  isHovered = true;
                });
              }
            },
            child: widget.builder(context, isHovered),
          );
  }
}
