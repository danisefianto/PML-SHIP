import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/cara_pembayaran_screen/widgets/carapembayaran_item_widget.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';

class CaraPembayaranScreen extends StatelessWidget {
  const CaraPembayaranScreen({Key? key}) : super(key: key);

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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilAkunScreen(),
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
                SizedBox(height: 19.v),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Cara Pembayaran",
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 4.v),
                      Divider(
                        color: const Color(0xFF4682B4), // Warna garis
                        thickness: 2.v, // Ketebalan garis
                      ),
                      SizedBox(height: 35.v),
                      Text(
                        "Pembayaran",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 31.v),
                _buildCaraPembayaran(context),
                SizedBox(height: 29.v),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Upload Bukti Pembayaran",
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 124.v,
                        width: 275.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4682B4),
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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

Widget _buildCaraPembayaran(BuildContext context) {
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    separatorBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 7.0.v),
        child: SizedBox(
          width: double.maxFinite,
          child: Divider(
            height: 2.v,
            thickness: 2.v,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    },
    itemCount: 8,
    itemBuilder: (context, index) {
      return const CarapembayaranItemWidget();
    },
  );
}
