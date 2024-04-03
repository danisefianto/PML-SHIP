import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/halaman_riwayat_2_screen/halaman_riwayat_2_screen.dart';
import 'package:pml_ship/presentation/halaman_riwayat_one_screen/halaman_riwayat_one_screen.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';

class HalamanProsesOrderScreen extends StatelessWidget {
  const HalamanProsesOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 34.v,
                  width: 57.h,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SizedBox(
                        height: 29.v,
                        width: 57.h,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgUserGray800,
                              height: 29.v,
                              width: 57.h,
                              marginBottom: 10.v,
                              alignment: Alignment.center,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 4.h),
                                child: const Text(
                                  "Back",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HalamanRiwayatonescreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 24.h,
                            height: 24.v,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 34.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HalamanRiwayat2Screen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 26.h),
                          child: Text(
                            "Riwayat",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HalamanProsesOrderScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 26.h),
                          child: Text(
                            "Dalam Proses",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.h),
                        height: 3.v,
                        color: const Color(0xFFDBEFEF),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.h),
                        height: 3.v,
                        color: const Color(0xFF4682B4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19.v),
                SizedBox(height: 19.v),
                _buildOrderDiproses(
                  context,
                ),
                SizedBox(height: 26.v),
                _buildOnShipping(context),
                SizedBox(height: 5.v),
                SizedBox(height: 2.v),
                _buildCruise(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 39,
      leadingWidth: 53,
      leading: AppbarLeadingImage(
        imagePath: 'assets/images/img_9_3_29x53.png',
        marginTop: 5,
        marginBottom: 5,
        marginLeft: 6,
        alignment: Alignment.center,
        height: 29,
      ),
      title: AppbarTitle(
        text: "PML SHIP",
        margin: EdgeInsets.only(left: 6),
        alignment: Alignment.center,
        marginLeft: 0,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4682B4),
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: 'assets/images/img_contrast.png',
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          alignment: Alignment.center,
        ),
      ],
      styleType: Style.bgFill,
      marginLeft: 0,
    );
  }

  Widget _buildOrderDiproses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.v),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOrderRow(
                    context,
                    "9 November 2024, 14:00",
                    "Taboneo-Kalimantan",
                    ImageConstant.imgOpenedFolder,
                    SizedBox(
                      height: 25.v,
                      width: 100.h,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.h, vertical: 3.v),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4682B4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Order Diproses",
                              style: CustomTextStyles.bodySmall10.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Container(
                    height: 54.v,
                    width: 100.h,
                    margin: EdgeInsets.only(left: 7.h),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgCruiseship,
                          height: 30.v,
                          width: 40.h,
                          marginBottom: 5.v,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCloseIndigo20001,
                          height: 37.v,
                          width: 41.h,
                          marginBottom: 5.v,
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCruiseship,
                          height: 30.v,
                          width: 40.h,
                          marginBottom: 5.v,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.h),
          ],
        ),
        SizedBox(height: 10.v),
      ],
    );
  }

  Widget _buildOnShipping(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.v),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOrderRow(
                    context,
                    "9 November 2024, 14:00",
                    "Taboneo-Kalimantan",
                    ImageConstant.imgCargoship,
                    SizedBox(
                      height: 25.v,
                      width: 100.h,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.h, vertical: 3.v),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4682B4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "On Shipping",
                              style: CustomTextStyles.bodySmall10.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Container(
                    height: 54.v,
                    width: 100.h,
                    margin: EdgeInsets.only(left: 7.h),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgCruiseship,
                          height: 30.v,
                          width: 40.h,
                          marginBottom: 5.v,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCloseIndigo20001,
                          height: 37.v,
                          width: 41.h,
                          marginBottom: 5.v,
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCruiseship,
                          height: 30.v,
                          width: 40.h,
                          marginBottom: 5.v,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.h),
          ],
        ),
        SizedBox(height: 10.v),
      ],
    );
  }

  Widget _buildCruise(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.v),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOrderRow(
                    context,
                    "9 November 2024, 14:00",
                    "Taboneo-Kalimantan",
                    ImageConstant.imgRefresh2821,
                    SizedBox(
                      height: 25.v,
                      width: 100.h,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.h, vertical: 3.v),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4682B4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Verifikasi Order",
                              style: CustomTextStyles.bodySmall10.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Container(
                    height: 54.v,
                    width: 100.h,
                    margin: EdgeInsets.only(left: 7.h),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgCruiseship,
                          height: 30.v,
                          width: 40.h,
                          marginBottom: 5.v,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCloseIndigo20001,
                          height: 37.v,
                          width: 41.h,
                          marginBottom: 5.v,
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCruiseship,
                          height: 30.v,
                          width: 40.h,
                          marginBottom: 5.v,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.h),
          ],
        ),
        SizedBox(height: 10.v),
      ],
    );
  }

  Widget _buildOrderRow(BuildContext context, String date, String location,
      String iconPath, Widget buttonWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: CustomTextStyles.bodySmall10
              .copyWith(color: Colors.black, fontSize: 14.0),
        ),
        Text(
          location,
          style: CustomTextStyles.bodySmall10
              .copyWith(color: Colors.black, fontSize: 14.0),
        ),
        SizedBox(height: 2.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath: iconPath,
              height: 25.v,
              width: 30.h,
              marginBottom: 10,
            ),
            SizedBox(width: 7.h),
            buttonWidget,
          ],
        ),
        SizedBox(height: 8.v),
      ],
    );
  }
}
