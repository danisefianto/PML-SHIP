import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';
import 'package:pml_ship/presentation/update_email_screen/update_email_screen.dart';
import 'package:pml_ship/presentation/aktivitas_masuk_screen/aktivitas_masuk_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/custom_switch.dart';
import 'package:pml_ship/core/app_export.dart';

// ignore: must_be_immutable
class KeamananAkunScreen extends StatelessWidget {
  KeamananAkunScreen({Key? key}) : super(key: key);

  bool isselectedSwitch = false;

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
                SizedBox(height: 25.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Keamanan Akun",
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            20), // Ubah angka 20 sesuai dengan ukuran yang diinginkan
                  ),
                ),
                SizedBox(height: 25.v),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Kelola dengan mudah akunmu disini",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 8.v),
                CustomImageView(
                  imagePath: ImageConstant.imgKelolaAkunmuDengan,
                  height: 9.v,
                  width: 168.h,
                  marginBottom: 10,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20.h),
                ),
                SizedBox(height: 33.v),
                _buildSwitch(context),
                SizedBox(height: 38.v),
                _buildUpdateEmail(context),
                SizedBox(height: 41.v),
                _buildRiwayat(context),
                SizedBox(height: 75.v),
                _buildButton(context),
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

  Widget _buildSwitch(BuildContext context) {
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
                  "Verifikasi dua langkah",
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
          _buildSwitchWidget(context),
        ],
      ),
    );
  }

  Widget _buildSwitchWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF9DB6D4),
      ),
      padding: const EdgeInsets.all(8),
      child: Transform.scale(
        scale: 0.7,
        child: CustomSwitch(
          alignment: Alignment.center,
          value: isselectedSwitch,
          onChange: (value) {
            isselectedSwitch = value;
          },
        ),
      ),
    );
  }

  Widget _buildUpdateEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 19.h, right: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Mengubah crossAxisAlignment menjadi CrossAxisAlignment.start
        children: [
          Expanded(
            // Menggunakan widget Expanded untuk menyeimbangkan ruang di dalam row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Update Email",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 4.v),
                const Text(
                  "Apabila ada email lain yang dipakai",
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          Colors.black), // Ganti dengan gaya teks yang sesuai
                ),
              ],
            ),
          ),
          SizedBox(
              width: 8
                  .h), // Memberikan jarak horizontal antara widget Column dan CustomElevatedButton
          _buildUpdateEmailButton(context),
        ],
      ),
    );
  }

  Widget _buildUpdateEmailButton(BuildContext context) {
    return CustomElevatedButton(
      width: 75.h,
      text: "Update Email",
      margin: EdgeInsets.only(top: 6.v),
      color: const Color(0xFF4682B4),
      onPressed: () {
        onTapUpdateEmail(context);
      },
      onTap: () {},
      buttonTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
      buttonTextstyle: null,
    );
  }

  Widget _buildRiwayat(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 7.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat Masuk",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 4.v),
                const Text(
                  "Lacak nama perangkat, lokasi dan tanggal",
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          Colors.black), // Ganti dengan gaya teks yang sesuai
                ),
              ],
            ),
          ),
          _buildRiwayatButton(context),
        ],
      ),
    );
  }

  Widget _buildRiwayatButton(BuildContext context) {
    return CustomElevatedButton(
      width: 75.h,
      text: "Riwayat",
      margin: EdgeInsets.only(top: 6.v),
      color: const Color(0xFF4682B4),
      onPressed: () {
        onTapRiwayat(context);
      },
      onTap: () {},
      buttonTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
      buttonTextstyle: null,
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 40.v), // Menambahkan jarak di bawah tombol
      child: Align(
        alignment: Alignment.center,
        child: CustomElevatedButton(
          height: 19.v,
          width: 76.h,
          text: "Next",
          color: const Color(0xFF4682B4),
          buttonTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          onPressed: () {},
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }

  void onTapUpdateEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            UpdateEmailScreen(), // Mengarahkan ke UpdateEmailScreen
      ),
    );
  }

  void onTapRiwayat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AktivitasMasukScreen(),
      ),
    );
  }
}
