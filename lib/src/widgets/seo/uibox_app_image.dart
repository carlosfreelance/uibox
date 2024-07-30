import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

class UiBoxAppImage extends StatelessWidget {
  final String alt;
  final String src;

  const UiBoxAppImage({
    super.key,
    required this.alt,
    required this.src,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.image(
      alt: alt,
      src: src,
      child: Image.network(src),
    );
  }
}
