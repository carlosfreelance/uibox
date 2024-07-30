import 'package:flutter/widgets.dart';

import '../utils/screen.dart';

class UiBoxWidget extends StatelessWidget with Screen {
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;

  /// Displays a widget appropriate to the screen size
  const UiBoxWidget({Key? key, this.xs, this.sm, this.md, this.lg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Screen.valueByScreen(context, xs: xs, sm: sm, md: md, lg: lg)!;
    });
  }
}
