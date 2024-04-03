import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/halaman_berhasil_screen_dua/halaman_berhasil_screen_dua.dart';
import 'package:pml_ship/presentation/metode_pembayaran_page/metode_pembayaran_page.dart';
import 'package:pml_ship/presentation/metode_pembayaran_satu_page/widgets/metode_pembayaran_satu_widget.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

class MetodePembayaranSatuPage extends StatefulWidget {
  const MetodePembayaranSatuPage({Key? key}) : super(key: key);

  @override
  _MetodePembayaranSatuPageState createState() =>
      _MetodePembayaranSatuPageState();
}

class _MetodePembayaranSatuPageState extends State<MetodePembayaranSatuPage> {
  bool isSelected = false; // Declare isSelected variable here

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
                                builder: (context) =>
                                    const MetodePembayaranPage(),
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
                SizedBox(height: 19.v),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 4.v),
                      Divider(
                        color: const Color(0xFF4682B4), // Warna garis
                        thickness: 2.v, // Ketebalan garis
                      ),
                      SizedBox(height: 35.v),
                      Text(
                        "Pembayaran I",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.v),
                _buildWaktuPembayaran(context),
                SizedBox(height: 31.v),
                _buildCaraPembayaran(context),
                SizedBox(height: 29.v),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Upload Bukti Pembayaran",
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 124.v,
                        width: 275.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4682B4),
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 31.v),
                _buildNext(context),
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

  /// Section Widget
  Widget _buildWaktuPembayaran(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.h, right: 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5, // Menambahkan flex untuk memberikan ruang lebih pada teks
            child: Text(
              "Waktu Pembayaran Selama",
              style: theme.textTheme.labelLarge,
              overflow: TextOverflow
                  .ellipsis, // Mengatasi overflow teks jika terlalu panjang
            ),
          ),
          SizedBox(
              width: 10), // Memberikan jarak horizontal antara teks dan waktu
          Flexible(
            // Menggunakan Flexible untuk mengatasi overflow pada waktu
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "23 Hours: 59 Minutes",
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaraPembayaran(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 7.0.v),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 2.v,
              thickness: 2.v,
              color: const Color(0xFF4682B4),
            ),
          ),
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Kartu Debit",
              bankName: "Bank BCA",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 1:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "Bank Mandiri",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 2:
            return MetodePembayaranSatuWidget(
              paymentMethod: "OneKlik",
              bankName: "BCA",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 3:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "BNI",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 4:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "BRI",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 5:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "BTN",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          default:
            return SizedBox.shrink();
        }
      },
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
                builder: (context) => const HalamanBerhasilScreenDua(),
              ),
            );
          },
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
