import 'package:flutter/material.dart';

class ColumnCenterWithScroll extends StatelessWidget {
  final Widget? child;
  final ScrollController? controller;
  const ColumnCenterWithScroll({super.key, this.child, this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        controller: controller!,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                child!,
              ],
            ),
          ),
        ),
      );
    });
  }
}
