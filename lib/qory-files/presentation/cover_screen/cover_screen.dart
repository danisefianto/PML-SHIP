import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/presentation/beranda_page/beranda_page.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 455.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 256.h,
                          child: Text(
                            "Selamat Datang di PML SHIP\n\nMau kirim Barang Tambang?? PML Ship in aja",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.img92,
                        width: 400.h,
                        marginBottom: 10,
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 57.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      width: 111.h,
                      text: "Masuk",
                      margin: EdgeInsets.only(bottom: 1.v, right: 5.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      color: Color(0xFF4682B4), // Warna tombol
                      onPressed: () {
                        onTapMasuk(context);
                      },
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BerandaPage(),
                          ),
                        );
                      }, // Tambahkan onTap
                      buttonTextstyle: TextStyle(
                          color: Colors.white), // Tambahkan buttonTextstyle
                    ),
                    CustomElevatedButton(
                      width: 111.h,
                      text: "Registrasi",
                      margin: EdgeInsets.only(bottom: 1.v, left: 5.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      color: Color(0xFF4682B4), // Warna tombol
                      onPressed: () {
                        onTapRegistrasi(context);
                      },
                      onTap: () {}, // Tambahkan onTap
                      buttonTextstyle: TextStyle(
                          color: Colors.white), // Tambahkan buttonTextstyle
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapMasuk(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BerandaPage()),
    ); // Implementasi aksi ketika tombol masuk ditekan
  }

  void onTapRegistrasi(BuildContext context) {
    // Implementasi aksi ketika tombol registrasi ditekan
  }
}
