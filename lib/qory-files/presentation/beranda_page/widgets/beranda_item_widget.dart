import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';

// ignore: must_be_immutable
class BerandaItemWidget extends StatelessWidget {
  const BerandaItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 214.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgGroup61,
        height: 153.v,
        width: 214.h,
        marginBottom: 10,
        margin: EdgeInsets.only(
          top: 9.v,
          bottom: 13.v,
        ),
      ),
    );
  }
}
