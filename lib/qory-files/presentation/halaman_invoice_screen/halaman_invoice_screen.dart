import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/halaman_berhasil_screen_satu/halaman_berhasil_screen_satu.dart';
import 'package:pml_ship/presentation/metode_pembayaran_page/metode_pembayaran_page.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';

class HalamanInvoiceScreen extends StatelessWidget {
  const HalamanInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

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
                                    const HalamanBerhasilScreenSatu(),
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
                SizedBox(height: 35.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h, right: 29.h),
                  child: _buildNomorInvoice(
                    context,
                    nomorInvoice: "Status:",
                    INVPML: "Menunggu Pembayaran",
                  ),
                ),
                SizedBox(height: 11.v),
                const Divider(),
                SizedBox(height: 10.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h, right: 29.h),
                  child: _buildNomorInvoice(
                    context,
                    nomorInvoice: "Nomor Invoice",
                    INVPML: "INV/2024202/PML/31918",
                  ),
                ),
                SizedBox(height: 13.v),
                const Divider(),
                SizedBox(height: 12.v),
                _buildVessel(context),
                SizedBox(height: 12.v),
                const Divider(),
                SizedBox(height: 14.v),
                _buildRute(context),
                SizedBox(height: 10.v),
                const Divider(),
                SizedBox(height: 10.v),
                _buildEstimasiDate(context),
                SizedBox(height: 13.v),
                const Divider(),
                SizedBox(height: 12.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.h, right: 57.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jenis Barang",
                          style: theme.textTheme.bodySmall,
                        ),
                        Text(
                          "Batu Bara",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                const Divider(),
                SizedBox(height: 15.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.h),
                    child: Text(
                      "Ringkasan Pembayaran",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h, right: 6.h),
                  child: _buildBiayaPengiriman(
                    context,
                    biayaPengiriman: "Harga",
                    rpCounter: "Rp 35.890.000,00",
                  ),
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h, right: 6.h),
                  child: _buildBiayaPengiriman(
                    context,
                    biayaPengiriman: "Biaya Pengiriman",
                    rpCounter: "Rp 23.000.000,00",
                  ),
                ),
                SizedBox(height: 7.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h, right: 6.h),
                  child: _buildBiayaPengiriman(
                    context,
                    biayaPengiriman: "Biaya Penanganan",
                    rpCounter: "Rp 7.400.000,00",
                  ),
                ),
                SizedBox(height: 7.v),
                _buildBiayaParkirPelabuhan(context),
                SizedBox(height: 7.v),
                _buildBiayaPajak(context),
                SizedBox(height: 9.v),
                _buildBayar(context),
                SizedBox(height: 54.v),
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

  Widget _buildVessel(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 22.h, right: 48.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vessel",
              style: theme.textTheme.bodySmall,
            ),
            Text(
              "TB BRAHMANA 1",
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRute(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.h, right: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rute",
            style: theme.textTheme.bodySmall,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "Kalimantan-Taboneo",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEstimasiDate(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 22.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Estimasi Date",
              style: theme.textTheme.bodySmall,
            ),
            Text(
              "2-15 November 2024 (13 DAYS)",
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiayaParkirPelabuhan(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.h, right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "Biaya Parkir Pelabuhan",
              style: theme.textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "Rp 3.300.000,00",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBiayaPajak(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.h, right: 7.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "Biaya Pajak",
              style: theme.textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "Rp 2.190.000,00",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBayar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.h, right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v, bottom: 8.v),
            child: Text(
              "Bayar",
              style:
                  theme.textTheme.bodySmall!.copyWith(color: appTheme.black900),
            ),
          ),
          CustomElevatedButton(
            height: 30, // Ubah tinggi tombol sesuai kebutuhan
            width: 125, // Ubah lebar tombol sesuai kebutuhan
            text: "Rp 35.890.000,00",
            color: const Color(0xFF4682B4),
            buttonTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            onPressed: () {
              // Tambahkan logika ketika tombol ditekan
            },
            onTap: () {},
            buttonTextstyle: null,
          ),
        ],
      ),
    );
  }

  Widget _buildNomorInvoice(BuildContext context,
      // ignore: non_constant_identifier_names
      {required String nomorInvoice,
      // ignore: non_constant_identifier_names
      required String INVPML}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nomorInvoice,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900),
        ),
        Text(
          INVPML,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900),
        ),
      ],
    );
  }

  Widget _buildBiayaPengiriman(BuildContext context,
      {required String biayaPengiriman, required String rpCounter}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(
            biayaPengiriman,
            style:
                theme.textTheme.bodySmall!.copyWith(color: appTheme.black900),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Text(
            rpCounter,
            style:
                theme.textTheme.bodySmall!.copyWith(color: appTheme.black900),
          ),
        ),
      ],
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
                  builder: (context) => const MetodePembayaranPage()),
            );
          },
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
