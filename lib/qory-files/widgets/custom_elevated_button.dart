import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  @override
  final EdgeInsets? margin;
  @override
  final TextStyle? buttonTextStyle;

  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    this.buttonTextStyle,
    required VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
    required Null Function() onTap,
    required TextStyle?
        buttonTextstyle, // Perubahan nama dan tipe data argumen ini
    required Color color,
  }) : super(
          key: key,
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: buildElevatedButtonWidget(),
          )
        : buildElevatedButtonWidget();
  }

  Widget buildElevatedButtonWidget() {
    return Container(
      height: height ?? 32,
      width: width ?? double.infinity,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: buttonStyle ?? ElevatedButton.styleFrom(),
        onPressed: isDisabled ?? false ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            Expanded(
              child: Text(
                text,
                style: buttonTextStyle ?? CustomTextStyles.bodySmallWhiteA700,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}
