import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/alamat_pelabuhan_screen/alamat_pelabuhan_screen.dart';
import 'package:pml_ship/presentation/beranda_page/beranda_page.dart';
import 'package:pml_ship/presentation/cara_pembayaran_screen/cara_pembayaran_screen.dart';
import 'package:pml_ship/presentation/halaman_input_order_screen/halaman_input_order_screen.dart';
import 'package:pml_ship/presentation/keamanan_akun_screen/keamanan_akun_screen.dart';
import 'package:pml_ship/presentation/notifikasi_screen/notifikasi_screen.dart';
import 'package:pml_ship/presentation/pengaturan_akun_screen/pengaturan_akun_screen.dart';
import 'package:pml_ship/presentation/profile_instansi_screen/profile_instansi_screen.dart';
import 'package:pml_ship/presentation/pusat_bantuan_screen/pusat_bantuan_screen.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';

class ProfilAkunScreen extends StatelessWidget {
  const ProfilAkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              _buildBackButton(context),
              SizedBox(height: 16),
              _buildEdit(context),
              SizedBox(height: 16),
              SizedBox(height: 12),
              _buildNamaInstansi(context),
              SizedBox(height: 12),
              CustomImageView(
                imagePath: ImageConstant.imgImage1,
                height: 173, // Menyesuaikan dengan ukuran imgImage12
                width: double.infinity,
                alignment: Alignment.center,
                marginTop: 12,
                marginBottom: 10,
              ),
              SizedBox(height: 16),
              _buildPesanan(context),
              SizedBox(height: 20),
              Divider(color: Colors.black),
              SizedBox(height: 20),
              _buildAlamatPelabuhan(context),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KeamananAkunScreen()),
                  );
                },
                child:
                    _buildKeamananAkun(context, keamananAkun: "Keamanan Akun"),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              _buildPusatBantuan(context),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              _buildNotifikasi(context),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              _buildCaraPembayaran(context),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              _buildProfilBisnis(context),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              _buildPengaturanAkun(context),
              SizedBox(height: 16),
              Divider(color: Colors.black),
              SizedBox(height: 16),
              _buildLogout(context), // Calling _buildLogout as a regular widget
              SizedBox(height: 16), // Add some space after _buildLogout
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

  Widget _buildEdit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant
                .imgImage12, // Menambahkan imagePath untuk gambar utama
            height: 173,
            marginBottom: 10,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10, right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEdit,
                    height: 24,
                    width: 24,
                    marginBottom: 10,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgContrast,
                          height: 80,
                          width: 80,
                          marginBottom: 10,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "qory_123",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNamaInstansi(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Instansi",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NPWP",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF4682B4),
                ),
              ),
              SizedBox(width: 8),
              Container(
                height: 24,
                width: 90,
                decoration: BoxDecoration(
                  color: Color(0xFF4682B4),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPesanan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pesanan",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HalamanInputOrderScreen()),
                  );
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAlamatPelabuhan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Alamat Pelabuhan",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlamatPelabuhanScreen()),
                  ); // Tambahkan fungsi untuk menangani ketika ikon silang diklik
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeamananAkun(BuildContext context,
      {required String keamananAkun, Function()? onTapClose}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                keamananAkun,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: onTapClose,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPusatBantuan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pusat Bantuan",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PusatBantuanScreen()),
                  );
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotifikasi(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notifikasi",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotifikasiScreen()),
                  );
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaraPembayaran(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cara Pembayaran",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CaraPembayaranScreen()),
                  );
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfilBisnis(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profil Instansi",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileInstansiScreen()),
                  );
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPengaturanAkun(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Pengaturan Akun",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PengaturanAkunScreen()),
                  );
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4682B4), // Change color to 4682B4
                    shape: BoxShape.rectangle, // Agar menjadi lingkaran
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogout(BuildContext context) {
    return Center(
      // Menggunakan Center untuk menempatkan widget di tengah secara horizontal
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: 90,
          height: 24,
          child: ElevatedButton(
            onPressed: () {
              // Add your action here
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color(0xFF4682B4),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BerandaPage(), // Ganti dengan nama halaman tujuan yang benar
            ),
          );
        },
        icon: const Icon(
          Icons.arrow_back, // Menggunakan ikon panah biasa
          color: Colors.white, // Menyesuaikan warna ikon menjadi putih
        ),
        label: const Text(
          "Back",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          // Menghapus properti 'primary' karena tidak diperlukan
          elevation: 0, // Menghapus bayangan tombol
        ),
      ),
    );
  }
}
