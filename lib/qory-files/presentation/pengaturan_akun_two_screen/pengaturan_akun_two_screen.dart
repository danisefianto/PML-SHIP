import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/pengaturan_akun_screen/pengaturan_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/custom_checkbox_button.dart';
import 'package:pml_ship/core/app_export.dart';

class PengaturanAkunTwoScreen extends StatefulWidget {
  const PengaturanAkunTwoScreen({Key? key}) : super(key: key);

  @override
  _PengaturanAkunTwoScreenState createState() =>
      _PengaturanAkunTwoScreenState();
}

class _PengaturanAkunTwoScreenState extends State<PengaturanAkunTwoScreen> {
  bool user = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          20.h), // Memberikan jarak ke margin kiri dan kanan
                  child: Text(
                    "Hapus Akun",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          20), // Memberikan jarak ke margin kiri dan kanan
                  child: Text(
                    "Setelah dihapus, kamu akan kehilangan akses informasi berikut :",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildListText("Riwayat Pesanan", theme),
              _buildListText("Promo", theme),
              _buildListText("Profil PML SHIP", theme),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        20), // Memberikan jarak ke margin kiri dan kanan
                child: Text(
                  "PML Ship tidak bertanggung jawab atas transaksi diluar kontak yang ada selain di PML Ship",
                  style: TextStyle(
                    fontStyle: FontStyle.normal, // Tidak italic
                    fontSize: 14, // Ukuran 12
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 17),
              _buildUser(context),
              const SizedBox(height: 8),
              _buildButtonRow(),
            ],
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

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 34,
      width: 57,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Expanded(
            child: SizedBox(
              height: 29,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  const CustomImageView(
                    imagePath: ImageConstant.imgUserGray800,
                    height: 29,
                    width: 57,
                    marginBottom: 10,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PengaturanAkunScreen(),
                  ),
                );
              },
              child: Container(
                width: 24,
                height: 24,
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
    );
  }

  Widget _buildListText(String text, ThemeData theme) {
    // Tambahkan parameter theme
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
              bottom: 8, left: 20), // Atur jarak bawah judul dan ke kiri
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black, // Definisikan warna teks
            ),
          ),
        ),
        const SizedBox(height: 4), // Tambahkan jarak antara judul dan teks
        _buildListSubText(text == "Riwayat Pesanan"
            ? "Rincian riwayat transaksi, alamat tersimpan, metode pembayaran, dll"
            : text == "Promo"
                ? "Semua promo, voucher yang pernah didapat"
                : "Info personal kamu di PML Ship"),
        const SizedBox(height: 8), // Tambahkan jarak setelah teks sub
        Container(
          height: 2, // Ketebalan garis
          color: const Color(0xFF4682B4), // Warna garis 4682B4
        ),
        const SizedBox(height: 8), // Tambahkan jarak setelah garis pembatas
      ],
    );
  }

  Widget _buildListSubText(String subText) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: 8, left: 20), // Atur jarak bawah teks dan ke kiri
      child: Text(
        subText,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUser(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20), // Memberikan jarak ke margin kiri dan kanan
      child: CustomCheckboxButton(
        alignment: Alignment.center,
        width: 322.h,
        text: "Saya setuju dan bersedia menghapus akun ini secara permanen",
        isExpandedText: true,
        value: user,
        isRightCheck: true,
        onChange: (value) {
          setState(() {
            user = value;
          });
        },
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14, // Ganti warna teks menjadi hitam
        ),
      ),
    );
  }

  onTapUser(BuildContext context) {
    // TODO: implement Actions
  }

  Widget _buildButtonRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20), // Atur jarak atas dan bawah, serta ke kiri dan kanan
      child: Column(
        children: [
          CustomElevatedButton(
            text: "Lanjut",
            onPressed: () {
              // Tambahkan logika onPressed yang diperlukan di sini
            },
            buttonTextstyle: const TextStyle(
              color: Color(0xFF4682B4), // Warna teks untuk tombol "Lanjut"
            ),
            color: const Color(
                0xFFDBEFEF), // Warna latar belakang untuk tombol "Lanjut"
            onTap: () {
              // Tambahkan logika onTap yang diperlukan di sini
            },
          ),
          const SizedBox(
              height: 16), // Atur jarak antara tombol "Lanjut" dan "Batal"
          CustomElevatedButton(
            text: "Batal",
            onPressed: () {
              // Tambahkan logika onPressed yang diperlukan di sini
            },
            buttonTextstyle: const TextStyle(
              color: Color(0xFFDBEFEF), // Warna teks untuk tombol "Batal"
            ),
            color: const Color(
                0xFF4682B4), // Warna latar belakang untuk tombol "Batal"
            onTap: () {
              // Tambahkan logika onTap yang diperlukan di sini
            },
          ),
        ],
      ),
    );
  }
}
