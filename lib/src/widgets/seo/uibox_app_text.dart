import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

class UiBoxAppText extends StatelessWidget {
  final String text;
  final TextTagStyle? tagStyle;

  final TextStyle? style;

  const UiBoxAppText({
    super.key,
    required this.text,
    this.tagStyle,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: text,
      style: tagStyle ?? TextTagStyle.p,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
