import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/proses_halaman_screen_satu/proses_halaman_screen_satu.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/core/app_export.dart';

// ignore: must_be_immutable
class HalamanRekomendasiScreen extends StatefulWidget {
  const HalamanRekomendasiScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HalamanRekomendasiScreenState createState() =>
      _HalamanRekomendasiScreenState();
}

class _HalamanRekomendasiScreenState extends State<HalamanRekomendasiScreen> {
  TextEditingController brahmaCounterController = TextEditingController();
  String? selectedVessel;
  String? selectedRoute;
  bool isCheckedRouteA = false;
  bool isCheckedRouteB = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppBar(context),
              SizedBox(height: 18.v),
              _buildBack(context), // Tambahkan _buildBack di sini
              SizedBox(height: 6.v),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    children: [
                      _buildShipperInfo(context),
                      SizedBox(height: 18.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text(
                            "Vessel Recommendation",
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 19.h, right: 20.h),
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: const Color(0xFF4682B4), // Warna border
                                width: 1.0, // Lebar border
                              ),
                              borderRadius: BorderRadius.circular(
                                  15.0), // Mengatur border menjadi elips
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedVessel,
                            items: <String>['Brahma 11', 'Vessel 2', 'Vessel 3']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedVessel = value;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Select Vessel',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text(
                            "Route Recommendation",
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.h),
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: const Color(0xFF4682B4), // Warna border
                                width: 1.0, // Lebar border
                              ),
                              borderRadius: BorderRadius.circular(
                                  15.0), // Mengatur border menjadi elips
                            ),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedRoute,
                            items: <String>[
                              'Route A: Taboneo-Selat A-Banjarmasin',
                              'Route B: Taboneo-Selat B-Banjarmasin',
                              'Route C: Taboneo-Selat C-Banjarmasin'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRoute = value;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Select Route',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.v),
                      _buildShipperInfo1(context),
                      SizedBox(height: 41.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.h),
                        child: _buildOTPPesan(
                          context,
                          routeB: "Route A",
                          isChecked: isCheckedRouteA,
                          onChanged: (isChecked) {
                            setState(() {
                              isCheckedRouteA = isChecked;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 32.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.h),
                        child: _buildOTPPesan(
                          context,
                          routeB: "Route B",
                          isChecked: isCheckedRouteB,
                          onChanged: (isChecked) {
                            setState(() {
                              isCheckedRouteB = isChecked;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Text(
                        "Lakukan Negosiasi dan Konfirmasi Order",
                        style: CustomTextStyles.bodySmall10.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Pada Layanan Whatsapp Berikut",
                        style: CustomTextStyles.bodySmall10.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 14.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 72.h,
                                height: 72.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF9DB6D4), // Warna lingkaran
                                ),
                                child: Center(
                                  child: CustomImageView(
                                    imagePath: 'assets/images/img_whatsapp.png',
                                    height: 37.v,
                                    width: 37.v,
                                    marginBottom: 10,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.v),
                              const Text(
                                "Whatsapp",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.h),
                            child: Column(
                              children: [
                                Container(
                                  width: 72.h,
                                  height: 72.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF9DB6D4), // Warna lingkaran
                                  ),
                                  child: Center(
                                    child: CustomImageView(
                                      imagePath:
                                          'assets/images/img_lock.png', // Sesuaikan dengan path yang benar

                                      height: 37.v,
                                      width: 37.v,
                                      marginBottom: 10,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.v),
                                const Text(
                                  "Conference online/offline",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 120.v),
                      _buildNext(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAppBar(BuildContext context) {
  return SizedBox(
    height: 39.v,
    width: double.maxFinite,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19.h),
            child: Text(
              "LOGO",
              style: CustomTextStyles.bodySmallWhiteA700,
            ),
          ),
        ),
        const CustomAppBar(
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
        ),
      ],
    ),
  );
}

Widget _buildBack(BuildContext context) {
  return Row(
    // Mengubah tata letak menjadi baris
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF4682B4), // Warna kotak
            borderRadius: BorderRadius.circular(5), // Ubah sesuai kebutuhan
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                MainAxisAlignment.start, // Tetapkan ke MainAxisAlignment.start
            children: [
              Icon(Icons.arrow_back,
                  color: Colors.white), // Ikon panah ke kiri dengan warna putih
              SizedBox(width: 5), // Beri jarak antara ikon dan teks
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Warna teks
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildShipperInfo(BuildContext context) {
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 2.v),
    decoration: AppDecoration.fillPrimary1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.v),
        const Text(
          "Recomendation",
          style: CustomTextStyles.bodySmallPoppinswhiteA700,
        ),
      ],
    ),
  );
}

Widget _buildShipperInfo1(BuildContext context) {
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 2.v),
    decoration: AppDecoration.fillPrimary1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.v),
        const Text(
          "Pilihan",
          style: CustomTextStyles.bodySmallPoppinswhiteA700,
        ),
      ],
    ),
  );
}

Widget _buildOTPPesan(
  BuildContext context, {
  required String routeB,
  bool isChecked = false,
  Function(bool)? onChanged,
}) {
  return GestureDetector(
    onTap: () {
      if (onChanged != null) {
        onChanged(!isChecked); // Toggle nilai isChecked saat tombol ditekan
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.v, bottom: 11.v),
          child: Text(
            routeB,
            style: CustomTextStyles.labelLargeBold.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Container(
          width: 30.v,
          height: 30.v,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isChecked
                  ? const Color(0xFF4682B4) // Warna border saat isChecked true
                  : const Color(
                      0xFF9DB6D4), // Warna border saat isChecked false
              width: 2.0, // Lebar border
            ),
          ),
          child: isChecked
              ? const Icon(
                  Icons.check,
                  color: Color(0xFF4682B4), // Warna centang
                )
              : null, // Jangan tampilkan centang jika isChecked false
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
                builder: (context) => const ProsesHalamanScreenSatu()),
          );
        },
        onTap: () {},
        buttonTextstyle: null,
      ),
    ),
  );
}
