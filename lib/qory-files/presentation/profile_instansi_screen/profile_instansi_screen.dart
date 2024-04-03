import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';

class ProfileInstansiScreen extends StatelessWidget {
  ProfileInstansiScreen({Key? key}) : super(key: key);

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
                                  child: Text(
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
                                builder: (context) => ProfilAkunScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 24.h,
                            height: 24.v,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Icon(
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
                SizedBox(height: 4.v),
                Center(
                  child: Text(
                    "Profile Instansi",
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(height: 21.v),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage3,
                        height: 91.v,
                        width: 250.h,
                        marginBottom: 10,
                      ),
                      SizedBox(height: 21.v),
                      Container(
                        width: 305.h,
                        margin: EdgeInsets.only(left: 8.h, right: 18.h),
                        child: Text(
                          "Patria Maritime Lines (PT. PML) adalah sebuah perusahaan jasa yang bergerak pada bidang pelayanan transportasi batubara, konsesi pertambangan, dan berbagai macam komoditas lainnya, dimana armada yang digunakan untuk pelayanan transportasi menggunakan tug-barge, self-propelled barge, dan juga proses transshipment dan transportasi menggunakan mother-vessel. Berkantor pusat di ibu kota Indonesia, DKI Jakarta, PT. PML melayani rute transportasi kargo domestik (cabotage) dan internasional (beyond cabotage). Patria Maritime Lines (PML) merupakan anak perusahaan PT United Tractors Pandu Engineering (UTE), yang juga merupakan anak perusahaan United Tractors (UT). United Tractors (UT) sendiri merupakan bagian dari Astra International.\n\nPT. PML dibangun berdasarkan pemahaman akan kebutuhan akan layanan berkualitas dan bernilai tambah dalam logistik maritim, khususnya transportasi energi dan komoditas. Pada tahun 2008, PT Patria Maritime Lines (PML) merupakan anak perusahaan dari PT United Tractors Pandu Engineering (UTE) yang juga merupakan bagian dari Astra International, grup otomotif independen terbesar di Asia Tenggara. Selama lebih dari satu dekade, PML terus berkembang dan tumbuh menjadi solusi logistik maritim terpercaya oleh perusahaan energi papan atas di Indonesia. Operasi telah disertifikasi oleh standar terbaru dari Organisasi Standar Internasional",
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black, // Tambahkan warna teks hitam
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
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
