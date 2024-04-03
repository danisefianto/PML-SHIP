import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pml_ship/core/utils/image_constant.dart';
import 'package:pml_ship/presentation/halaman_navigasi_dua_screen/halaman_navigasi_dua_screen.dart';
import 'package:pml_ship/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class HalamanNavigasiEmpatScreen extends StatelessWidget {
  HalamanNavigasiEmpatScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            _buildMap(context),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFF4682B4)),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: fromController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            border: InputBorder.none,
                            hintText: 'Enter starting point',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFF4682B4)),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: toController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            border: InputBorder.none,
                            hintText: 'Enter destination',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Positioned(
              bottom: 270,
              right: 25,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HalamanNavigasiDuaScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4682B4), // Warna latar belakang
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  width: 90,
                  height: 24,
                  alignment: Alignment.center,
                  child: Text(
                    'Status : Finish',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 300, // Naikkan posisi tombol
              right: 25,
              child: Container(
                width: 90,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xFF4682B4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '21:22 WIB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 230, // Turunkan posisi tombol Refresh Halaman
              right: 60,
              child: Container(
                width: 40,
                child: Text(
                  "Refresh Halaman",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black, // Tetapkan warna teks menjadi hitam
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 230, // Turunkan posisi tombol Play dan Refresh Icons
              right: 25,
              child: Container(
                width: 30,
                height: 29, // Ukuran container
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Bentuk container menjadi lingkaran
                  color: Color(0xFF4682B4), // Warna latar belakang
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgPlay,
                      width: 29,
                      marginBottom: 10,
                      alignment: Alignment.center,
                    ),
                    Positioned(
                      bottom: 0,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgRefresh,
                        height: 23,
                        marginBottom: 0,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 230, // Turunkan posisi tombol Button with time text
              left: 25,
              child: SizedBox(
                height: 30,
                width: 90, // Lebarkan tombolnya
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle button press
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Berkas SPAL",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                        0xFF4682B4), // Ubah warna latar belakang menjadi 4682B4
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: _buildSearch(
                  context), // Placing _buildSearch widget at the bottom
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 -
                  57.5, // Menengahkan vertikal
              left: MediaQuery.of(context).size.width / 2 -
                  137.5, // Menengahkan horizontal
              child: Container(
                width: 275,
                height: 115,
                decoration: BoxDecoration(
                  color: Color(0xFF9DB6D4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Pesanan Selesai',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    return Image.asset(
      'assets/images/img_map.png',
      height: MediaQuery.of(context).size.height,
      width: double.maxFinite,
      fit: BoxFit.cover,
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF4682B4)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ship Information:",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/images/img_image_3.png', // Ubah path dengan path gambar Anda
              width: 300,
              height: 90,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16),
            Text(
              "~ Terimakasih telah mempercayai PT Patria Maritime Lines sebagai mitra Shipping Logistik anda! ~",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
