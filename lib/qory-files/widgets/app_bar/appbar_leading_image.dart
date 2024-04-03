import 'package:flutter/material.dart';

class AppbarLeadingImage extends StatelessWidget {
  final String imagePath;
  final double? marginTop;
  final double? marginBottom; // Added marginBottom parameter
  final double? marginLeft;
  final Alignment alignment;
  final double height;
  final EdgeInsetsGeometry? margin;

  const AppbarLeadingImage({
    required this.imagePath,
    this.marginTop,
    this.marginBottom, // Added marginBottom to the constructor
    this.marginLeft,
    required this.alignment,
    required this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Image.asset(
        imagePath,
        height: height,
      ),
    );
  }
}
