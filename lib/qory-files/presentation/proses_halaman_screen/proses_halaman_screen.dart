import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/halaman_berhasil_screen/halaman_berhasil_screen.dart';
import 'package:pml_ship/presentation/planning_order_mitigasi_screen/planning_order_mitigasi_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

class ProsesHalamanScreen extends StatelessWidget {
  const ProsesHalamanScreen({Key? key}) : super(key: key);

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
              Stack(
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
                            builder: (context) => PlanningOrderMitigasiScreen(),
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
              SizedBox(height: 10.v), // Tambahkan jarak di sini
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 29,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF9DB6D4), // Warna latar belakang
                      shape: BoxShape
                          .circle, // Membuatnya menjadi bentuk lingkaran
                    ),
                    child: CustomImageView(
                      imagePath: 'assets/images/img_refresh.png',
                      height: 23.v,
                      marginBottom: 10,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 3.v),
                    ),
                  ),
                  SizedBox(width: 8.h), // Beri jarak antara gambar dan teks
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 40.h,
                      child: Text(
                        "Refresh Halaman",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors
                              .black, // Definisikan warna teks menjadi hitam
                          fontSize: 10, // Sesuaikan ukuran teks
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.v),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 34.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgNext,
                      height: 180.adaptSize,
                      width: 180.adaptSize,
                      marginBottom: 10.v,
                    ),
                    SizedBox(height: 14.v),
                    const Text(
                      "Ordernya sedang diproses ya",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Tambahkan warna hitam di sini
                      ),
                    ),
                    SizedBox(height: 47.v),
                    Text("Mohon ditunggu untuk beberapa jam kemudian ",
                        style: theme.textTheme.bodySmall),
                    SizedBox(height: 120.v),
                    _buildNext(context), // Tambahkan method _buildNext di sini
                  ],
                ),
              ),
            ],
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
              MaterialPageRoute(builder: (context) => HalamanBerhasilScreen()),
            );
          },
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
