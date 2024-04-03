import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/keamanan_akun_screen/keamanan_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';

class AktivitasMasukScreen extends StatelessWidget {
  const AktivitasMasukScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
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
                                  builder: (context) => KeamananAkunScreen(),
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
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 27.v),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "Laporkan jika ada yang tidak dikenal",
                      style: CustomTextStyles.bodySmall10.copyWith(
                        color: Colors.black, // Ubah warna teks menjadi hitam
                      ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Center(
                    child: Container(
                      width: 285.h,
                      margin: EdgeInsets.only(left: 3.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 28.h, vertical: 5.v),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF4682B4), // Warna garis
                            width: 2.0, // Lebar garis
                          ),
                          borderRadius: BorderRadius.circular(
                              10), // Menggunakan BorderRadius.circular untuk membuat borderRadius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Pusatkan kolom secara horizontal
                          children: [
                            SizedBox(height: 10.v),
                            SizedBox(
                              width: 113.h,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Padang, Indonesia\n",
                                      style:
                                          CustomTextStyles.bodysmallff000000_1,
                                    ),
                                    TextSpan(
                                      text: "Aktif, Android, Samsung",
                                      style: CustomTextStyles.bodysmallff000000,
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
                  SizedBox(height: 27.v),
                  Center(
                    child: Container(
                      width: 285.h,
                      margin: EdgeInsets.only(left: 3.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 28.h, vertical: 5.v),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF4682B4), // Warna garis
                            width: 2.0, // Lebar garis
                          ),
                          borderRadius: BorderRadius.circular(
                              10), // Menggunakan BorderRadius.circular untuk membuat borderRadius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Pusatkan kolom secara horizontal
                          children: [
                            SizedBox(height: 10.v),
                            SizedBox(
                              width: 113.h,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Padang, Indonesia\n",
                                      style:
                                          CustomTextStyles.bodysmallff000000_1,
                                    ),
                                    TextSpan(
                                      text: "Aktif, Android, Samsung",
                                      style: CustomTextStyles.bodysmallff000000,
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
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ],
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
