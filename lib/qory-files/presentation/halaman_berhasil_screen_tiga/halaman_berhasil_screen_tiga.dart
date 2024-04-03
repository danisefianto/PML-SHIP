import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/conference_one_page/conference_one_page.dart';
import 'package:pml_ship/presentation/halaman_berhasil_screen_dua/halaman_berhasil_screen_dua.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

class HalamanBerhasilScreenTiga extends StatelessWidget {
  const HalamanBerhasilScreenTiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBarContent(context),
              SizedBox(height: 79.v),
              _buildTwentySeven(context),
              SizedBox(height: 5.v),
              _buildNext(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return const CustomAppBar(
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

  Widget _buildAppBarContent(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          left: 0,
          child: SizedBox(
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HalamanBerhasilScreenDua(),
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
    );
  }

  Widget _buildTwentySeven(BuildContext context) {
    return SizedBox(
      height: 250.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: const EdgeInsets.all(0),
              color: appTheme.indigo20001,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              child: Container(
                height: 180.v,
                width: 180.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 46.h,
                  vertical: 35.v,
                ),
                decoration: AppDecoration.fillIndigo.copyWith(
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    SizedBox(height: 34.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlugin,
                      height: 180.adaptSize,
                      width: 180.adaptSize,
                      marginBottom: 10.v,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 66.7, // Letakkan kontainer ID di atas tanda ceklis
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 68.h,
                vertical: 66.7,
              ),
              decoration: BoxDecoration(
                color: appTheme.indigo20001.withOpacity(0.5), // Efek blur
                borderRadius: BorderRadius.circular(20), // Bentuk bulat
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 34.v),
                  Text(
                    "ORDER ID: 58920.03839.09",
                    style: CustomTextStyles.titleMediumwhiteA700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: Alignment.center,
        child: CustomElevatedButton(
          height: 19,
          width: 76,
          text: "Next",
          color: const Color(0xFF4682B4),
          buttonTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConferenceOnePage(),
              ),
            );
          },
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
