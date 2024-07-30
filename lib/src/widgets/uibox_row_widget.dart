import 'package:flutter/widgets.dart';

import '../utils/screen.dart';

class UiBoxRow extends StatelessWidget with Screen {
  final List<Widget> children;
  final int colXs, colSm, colMd, colLg;

  final MainAxisSize colMainAxisSize, rowMainAxisSize;
  final MainAxisAlignment colMainAxisAlignment, rowMainAxisAlignment;
  final VerticalDirection colVerticalDirection, rowVerticalDirection;

  /// Creates a row, which adapts according to screen size
  const UiBoxRow({
    Key? key,
    this.colXs = 1,
    this.colSm = 1,
    this.colMd = 1,
    this.colLg = 1,
    this.colMainAxisSize = MainAxisSize.max,
    this.rowMainAxisSize = MainAxisSize.max,
    this.colMainAxisAlignment = MainAxisAlignment.start,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.colVerticalDirection = VerticalDirection.down,
    this.rowVerticalDirection = VerticalDirection.down,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      int maxColumns = _getMaxColumns(context,
          colXs: colXs, colSm: colSm, colMd: colMd, colLg: colLg);
      List<Widget> columns = [];
      List<Widget> rows = [];
      for (Widget child in children) {
        if (rows.length >= maxColumns) {
          columns.add(_addColums(rows));
          rows.clear();
        }
        rows.add(child);
      }
      if (rows.isNotEmpty) {
        columns.add(_addColums(rows));
        rows.clear();
      }
      return _addRows(columns);
    });
  }

  Widget _addColums(List<Widget> widgets) {
    return Row(
      mainAxisSize: colMainAxisSize,
      mainAxisAlignment: colMainAxisAlignment,
      verticalDirection: colVerticalDirection,
      children: List.from(widgets),
    );
  }

  Widget _addRows(List<Widget> widgets) {
    return Column(
      mainAxisSize: rowMainAxisSize,
      mainAxisAlignment: rowMainAxisAlignment,
      verticalDirection: rowVerticalDirection,
      children: List.from(widgets),
    );
  }

  int _getMaxColumns(
    BuildContext context, {
    int colXs = 1,
    int colSm = 1,
    int colMd = 1,
    int colLg = 1,
  }) {
    switch (Screen.screenSize(context)) {
      case ScreenSize.lg:
        return colLg;
      case ScreenSize.md:
        return colMd;
      case ScreenSize.sm:
        return colSm;
      default:
        return colXs;
    }
  }
}
