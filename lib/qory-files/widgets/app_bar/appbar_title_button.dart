import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

class AppbarTitleButton extends StatelessWidget {
  const AppbarTitleButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          width: 66.h,
          text: "Back",
          onPressed: () {}, // Dummy onPressed function
          buttonTextStyle: TextStyle(color: Colors.white), // Example text style
          color: Color(0xFF4682B4), onTap: () {},
          buttonTextstyle: null, // Example color
        ),
      ),
    );
  }
}
