import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/custom_switch.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  bool isSelectedSwitch = false;

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
                                  builder: (context) =>
                                      const ProfilAkunScreen(),
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
                  SizedBox(
                    height: 20.v,
                  ), // Tambahkan jarak antara judul dan teks "Notifikasi"
                  Align(
                    // Perbaikan: Menggunakan Align untuk mengatur posisi teks "Notifikasi"
                    alignment: Alignment.center,
                    child: Text(
                      "Notifikasi",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 59.v,
                  ), // Pindahkan jarak setelah judul
                  Padding(
                    padding: EdgeInsets.only(left: 33.h),
                    child: const Text(
                      "Update Penting",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Container(
                    width: 230.h,
                    margin: EdgeInsets.only(left: 33.h),
                    child: Text(
                      "Berisi update perihal pesanan, trip dan info akun. \nJadi harus diaktifin",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmall10.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  const Divider(),
                  SizedBox(height: 15.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 33.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Promo dan lainnya",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.v),
                              Text(
                                "Nonaktifkan notifikasi perihal promo dan rekomendasi.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmall10.copyWith(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 37.v,
                        width: 54.h,
                        margin: EdgeInsets.only(left: 15.h, bottom: 2.v),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF9DB6D4),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Transform.scale(
                                scale: 0.7,
                                child: CustomSwitch(
                                  alignment: Alignment.center,
                                  value: isSelectedSwitch,
                                  onChange: (value) {
                                    setState(() {
                                      isSelectedSwitch = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.v),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 150,
                      child: CustomElevatedButton(
                        text: "Next",
                        alignment: Alignment.center,
                        onPressed: () {},
                        onTap: () {},
                        buttonTextstyle: null,
                        color: const Color(0xFF4682B4),
                      ),
                    ),
                  ),
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
