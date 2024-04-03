import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/halaman_navigasi_dua_screen/halaman_navigasi_dua_screen.dart';
import 'package:pml_ship/presentation/metode_pembayaran_dua_page/metode_pembayaran_dua_page.dart';
import 'package:pml_ship/presentation/metode_pembayaran_lima_page/metode_pembayaran_lima_page.dart';
import 'package:pml_ship/presentation/metode_pembayaran_page/metode_pembayaran_page.dart';
import 'package:pml_ship/presentation/tracking_one_screen/tracking_one_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/theme/custom_text_style.dart';

class MetodePembayaranEmpatPage extends StatelessWidget {
  const MetodePembayaranEmpatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              _buildHeader(context),
              SizedBox(height: 8),
              _buildPaymentOptions(context),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildCardOrder(context),
                ),
              ),
              SizedBox(height: 16),
              _buildConfirmationButton(context),
              SizedBox(height: 16),
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

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 34,
          width: 57,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                height: 29,
                width: 57,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgUserGray800,
                      height: 29,
                      width: 57,
                      marginBottom: 10,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
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
                        builder: (context) => HalamanNavigasiDuaScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 24,
                    height: 24,
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
        SizedBox(height: 16),
        Center(
          child: Text(
            "Opsi Pembayaran",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MetodePembayaranPage(),
                ),
              );
            },
            child: Container(
              width: 120,
              height: 75,
              color: const Color(0xFF4682B4),
              child: Center(
                child: Text(
                  "Pembayaran 1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MetodePembayaranDuaPage(),
                ),
              );
            },
            child: Container(
              width: 120,
              height: 75,
              color: const Color(0xFF9DB6D4),
              child: Center(
                child: Text(
                  "Pembayaran 2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MetodePembayaranLimaPage(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 75,
                  color: const Color(0xFF4682B4),
                  child: Center(
                    child: Text(
                      "Pembayaran 3",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 5,
                  color: const Color(0xFF9DB6D4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardOrder(BuildContext context) {
    return Container(
      width: 336,
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: AppDecoration.outlinePrimary2.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "2024-02-29T07:25:05+08:00",
            style: CustomTextStyles.bodySmallPoppins,
          ),
          SizedBox(height: 9),
          Text(
            "Pembayaran di awal, tengah dan di akhir",
            style: CustomTextStyles.bodySmallPoppins,
          ),
          SizedBox(height: 9),
          Text(
            "Ketentuan : ",
            style: CustomTextStyles.bodySmallPoppins,
          ),
          SizedBox(height: 9),
          Text(
            "DP minimum 25%",
            style: CustomTextStyles.bodySmallPoppins,
          ),
          SizedBox(height: 16), // Tambahkan jarak antara teks dan tombol
          CustomElevatedButton(
            width: 92,
            text: "Bayar",
            color: const Color(0xFF4682B4),
            buttonStyle: CustomButtonStyles.fillPrimaryTL16,
            alignment: Alignment.centerRight,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MetodePembayaranLimaPage(),
                ),
              );
            },
            onTap: () {},
            buttonTextstyle: null,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildConfirmationButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomElevatedButton(
        height: 19,
        width: 76,
        text: "Konfirmasi",
        color: const Color(0xFF4682B4),
        buttonTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MetodePembayaranLimaPage(),
            ),
          );
        },
        onTap: () {},
        buttonTextstyle: null,
      ),
    );
  }
}
