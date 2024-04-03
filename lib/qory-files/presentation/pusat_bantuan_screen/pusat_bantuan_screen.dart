import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';

class PusatBantuanScreen extends StatefulWidget {
  const PusatBantuanScreen({Key? key}) : super(key: key);

  @override
  _PusatBantuanScreenState createState() => _PusatBantuanScreenState();
}

class _PusatBantuanScreenState extends State<PusatBantuanScreen> {
  bool isTulisanTersediaVisible = false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

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
                  SizedBox(height: 18.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 10.h),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Bagaimana cara melakukan order?",
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 10.h),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Apa saja vessel yang tersedia?",
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 10.h),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTulisanTersediaVisible = !isTulisanTersediaVisible;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text(
                                "Apa PML melayani order internasional?",
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: appTheme.black900,
                                ),
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgFavorite,
                            height: 13.v,
                            width: 22.h,
                            marginBottom: 10,
                            margin: EdgeInsets.only(
                              left: 2.h,
                              bottom: 3.v,
                            ), // Sesuaikan margin di sini
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 11.v),
                  isTulisanTersediaVisible
                      ? _buildTulisanDenganGaris(
                          context,
                          tulisan:
                              "PML melayani order internasional melalui layanan pengiriman khusus dengan beberapa metode pengiriman yang tersedia.",
                        )
                      : const SizedBox(),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 10.h),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Apa saja logistik yang bisa dikirim PML?",
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 10.h),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan:
                          "Bagaimana cara menghubungi admin secara langsung?",
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 10.h),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Berapa maksimal seseorang melakukan order?",
                    ),
                  ),
                  SizedBox(height: 11.v),
                ],
              ),
            ),
          ],
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

  Widget _buildTulisanDenganGaris(BuildContext context,
      {required String tulisan}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text(
                  tulisan,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgFavorite,
              height: 13.v,
              width: 22.h,
              marginBottom: 10,
              margin: EdgeInsets.only(
                left: 2.h,
                bottom: 3.v,
              ), // Sesuaikan margin di sini
            ),
          ],
        ),
        const Divider(
          height: 1,
          color: Colors.black,
        ),
        SizedBox(height: 11.v),
      ],
    );
  }
}
