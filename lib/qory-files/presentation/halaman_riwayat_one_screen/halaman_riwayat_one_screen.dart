import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/beranda_page/beranda_page.dart';
import 'package:pml_ship/presentation/halaman_proses_order_screen/halaman_proses_order_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';

class HalamanRiwayatonescreen extends StatefulWidget {
  const HalamanRiwayatonescreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HalamanRiwayatonescreenState createState() =>
      _HalamanRiwayatonescreenState();
}

class _HalamanRiwayatonescreenState extends State<HalamanRiwayatonescreen> {
  List<bool> ratingList = List.filled(5, false);
  bool isRated = false;
  double rating = 0; // Definisikan variabel rating

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 12.v),
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
                                      BerandaPage()), // Navigasi ke ProfilAkunScreen
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
                      flex: 1, // Tambahkan flex untuk memperluas widget
                      child: Padding(
                        padding: EdgeInsets.only(left: 26.h),
                        child: Text(
                          "Pesanan",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1, // Tambahkan flex untuk memperluas widget
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
                Padding(
                  padding: EdgeInsets.only(left: 26.h, right: 34.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // Gunakan Expanded di dalam Row
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2 November 2023, 10:00",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Taboneo-Kalimantan",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width:
                                  20), // Tambahkan jarak horizontal antara kolom dan rating
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 20, // Mengurangi ukuran bintang
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            onRatingUpdate: (rating) {
                              setState(() {
                                this.rating = rating;
                              });
                            },
                            updateOnDrag: true,
                            unratedColor: const Color(0xFF4682B4),
                            glow: false,
                          ),
                        ],
                      ),
                      if (rating >
                          0) // Tampilkan tombol hanya jika ada rating yang diberikan
                        Padding(
                          padding: EdgeInsets.only(
                            left: 26.h,
                            right: 34.h,
                            top: 12.v, // Tambahkan padding atas
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Aksi ketika tombol "Pesanan Selesai" ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4682B4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Text(
                              "Pesanan Selesai",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 2.v),
                      Container(
                        height: 74.v,
                        width: 100.h,
                        margin: EdgeInsets.only(left: 7.h),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgMobile,
                              height: 37.v,
                              width: 41.h,
                              marginBottom: 10.v,
                              alignment: Alignment.center,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgCruiseship,
                              height: 30.v,
                              width: 46.h,
                              marginBottom: 10.v,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 2.v),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgCloseIndigo20001,
                              height: 37.v,
                              width: 41.h,
                              marginBottom: 10.v,
                              alignment: Alignment.center,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgCruiseship,
                              height: 30.v,
                              width: 46.h,
                              marginBottom: 10.v,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 2.v),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.v),
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
