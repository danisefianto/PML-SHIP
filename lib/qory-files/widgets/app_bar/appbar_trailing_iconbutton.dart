import 'package:pml_ship/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbutton extends StatelessWidget {
  final String imagePath;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment; // Tambahkan parameter alignment

  const AppbarTrailingIconbutton({
    required this.imagePath,
    this.margin,
    this.alignment, // Tambahkan parameter alignment
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
        child: CustomIconButton(
          height: 34.adaptSize,
          width: 34.adaptSize,
          child: const CustomImageView(
            marginBottom: 10,
            imagePath: ImageConstant.imgContrast,
          ),
        ),
      ),
    );
  }
}
