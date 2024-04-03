import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/cover_screen/cover_screen.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0E0E0), Color(0xFF9E9E9E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.9],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Hero(
                  tag: 'landing_image', // Tag untuk animasi Hero
                  child: CustomImageView(
                    imagePath: ImageConstant.imgImage7,
                    fit: BoxFit.cover,
                    marginBottom: 10,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 100.0), // Jarak dari bawah ke atas gambar
                    Text(
                      "PML SHIP",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Jasa kirim barang dengan aman dan terpercaya menggunakan kapal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 32.0),
                    _buildGetStarted(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStarted(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 128, right: 122, bottom: 33),
      child: SizedBox(
        width: 110, // Tentukan lebar yang diinginkan untuk tombol
        child: CustomElevatedButton(
          text: "Get Started",
          buttonStyle: CustomButtonStyles.fillIndigoTL16,
          color: const Color(0xFF4682B4), // Menambahkan warna button
          onPressed: () {
            _navigateToCoverScreen(context);
          },
          buttonTextstyle: null,
          onTap: () {},
        ),
      ),
    );
  }

  void _navigateToCoverScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CoverScreen()),
    );
  }
}
