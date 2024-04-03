import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/pengaturan_akun_two_screen/pengaturan_akun_two_screen.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/core/app_export.dart';

class PengaturanAkunScreen extends StatelessWidget {
  const PengaturanAkunScreen({Key? key}) : super(key: key);

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
                SizedBox(height: 14.v),
                Center(
                  child: Text(
                    "Pengaturan Akun",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 18.v),
                const Divider(
                  color: Color(0xFF4682B4),
                ),
                SizedBox(height: 17.v),
                _buildMasukViaOTP(
                    context), // Perbaiki penyerahan parameter menjadi context
                SizedBox(height: 23.v),
                _buildKeluar(
                    context), // Perbaiki penyerahan parameter menjadi context
                SizedBox(height: 23.v),
                _buildHapusAkun(
                    context), // Perbaiki penyerahan parameter menjadi context
                SizedBox(height: 20.v),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    child: CustomElevatedButton(
                      text: "Next",
                      alignment: Alignment.center,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PengaturanAkunTwoScreen(),
                          ),
                        );
                      },
                      buttonTextstyle: const TextStyle(
                        fontSize: 14,
                      ),
                      color: const Color(0xFF4682B4),
                      onTap: () {},
                    ),
                  ),
                ),

                SizedBox(height: 20.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMasukViaOTP(BuildContext context) {
    final theme = Theme.of(context); // Peroleh ThemeData dari context

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masuk via OTP", // Ubah tulisan menjadi "Masuk via OTP"
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 2.v),
                const Text(
                  "Masuk ke akunmu dengan kemanan tambahan",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          _buildSwitchWidget(
              context), // Perbaiki penyerahan parameter menjadi context
        ],
      ),
    );
  }

  Widget _buildSwitchWidget(BuildContext context) {
    Theme.of(context); // Peroleh ThemeData dari context

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF9DB6D4),
      ),
      padding: const EdgeInsets.all(8),
      child: Transform.scale(
        scale: 0.7,
        child: CustomImageView(
          imagePath: ImageConstant.imgToggleon, // Perubahan di sini
          width: 15.h, // Sesuaikan ukuran gambar sesuai kebutuhan
          height: 15.v,
          marginBottom: 10,
        ),
      ),
    );
  }

  Widget _buildKeluar(BuildContext context) {
    final theme = Theme.of(context); // Peroleh ThemeData dari context

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Keluar",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 5.v),
                const Text(
                  "Apabila ada email lain yang dipakai",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.h),
          CustomImageView(
            imagePath: ImageConstant.imgFavorite,
            height: 13.v,
            width: 22.h,
            marginBottom: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildHapusAkun(BuildContext context) {
    final theme = Theme.of(context); // Peroleh ThemeData dari context

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hapus Akun",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 5.v),
                const Text(
                  "Akunmu akan dihapus secara permanen.\nJadi kamu gak bisa lagi akses riwayat pesanan\ndan detail lainnya dari akunmu",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.h),
          CustomImageView(
            imagePath: ImageConstant.imgFavorite,
            height: 13.v,
            width: 22.h,
            marginBottom: 10,
          ),
        ],
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
