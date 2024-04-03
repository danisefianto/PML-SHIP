import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/halaman_riwayat_one_screen/halaman_riwayat_one_screen.dart';
import 'package:pml_ship/presentation/halaman_transaksi_diproses/halaman_transaksi_diproses.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';

class HalamanRiwayat2Screen extends StatelessWidget {
  const HalamanRiwayat2Screen({Key? key}) : super(key: key);

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
                                  Navigator.pop(
                                      context); // Kembali ke HalamanProsesOrderScreen
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
                                  const HalamanTransaksiDiproses(), // Navigasi ke HalamanTransaksiDiproses
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
                        color: const Color(0xFF4682B4),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.h),
                        height: 3.v,
                        color: const Color(0xFFDBEFEF),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 20
                        .v), // Tambahkan spasi untuk memisahkan dari garis di atas
                // Tempatkan Stack di sini di luar dari Row
                Center(
                  child: SizedBox(
                    height: 264.v,
                    width: 229.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFoggySeaAndParked,
                          height: 232.v,
                          width: 229.h,
                          marginBottom: 10.v,
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          top: 0,
                          child: SizedBox(
                            width: 170.h,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Pesen Kapal, yuk\n",
                                    style: CustomTextStyles.labelLargeff000000,
                                  ),
                                  const TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "PML dengan senang hati membantu",
                                    style: CustomTextStyles.bodysmallff000000,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
}
