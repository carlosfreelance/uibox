import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

class UiBoxAppLink extends StatelessWidget {
  final String anchor;
  final String href;
  final Widget child;

  const UiBoxAppLink({
    super.key,
    required this.anchor,
    required this.href,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.link(
      anchor: anchor,
      href: href,
      child: child,
    );
  }
}
