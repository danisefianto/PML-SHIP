import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment; // Tambahkan parameter alignment

  const AppbarTitle({
    required this.text,
    this.margin, // Tambahkan parameter margin
    this.alignment,
    required int marginLeft,
    required TextStyle textStyle, // Tambahkan parameter marginLeft
  });

  get onTap => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          "PML SHIP", // Teks yang ditampilkan
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4682B4),
          ),
        ),
      ),
    );
  }
}
