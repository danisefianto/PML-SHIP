import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact Us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.image.imagePatriaMaritimeLinesLogo.image(height: 50),
                  const SizedBox(height: 21),
                  Text(
                    "Patria Maritime Lines (PT. PML) adalah sebuah perusahaan jasa yang bergerak pada bidang pelayanan transportasi batubara, konsesi pertambangan, dan berbagai macam komoditas lainnya, dimana armada yang digunakan untuk pelayanan transportasi menggunakan tug-barge, self-propelled barge, dan juga proses transshipment dan transportasi menggunakan mother-vessel. Berkantor pusat di ibu kota Indonesia, DKI Jakarta, PT. PML melayani rute transportasi kargo domestik (cabotage) dan internasional (beyond cabotage). Patria Maritime Lines (PML) merupakan anak perusahaan PT United Tractors Pandu Engineering (UTE), yang juga merupakan anak perusahaan United Tractors (UT). United Tractors (UT) sendiri merupakan bagian dari Astra International.\n\nPT. PML dibangun berdasarkan pemahaman akan kebutuhan akan layanan berkualitas dan bernilai tambah dalam logistik maritim, khususnya transportasi energi dan komoditas. Pada tahun 2008, PT Patria Maritime Lines (PML) merupakan anak perusahaan dari PT United Tractors Pandu Engineering (UTE) yang juga merupakan bagian dari Astra International, grup otomotif independen terbesar di Asia Tenggara. Selama lebih dari satu dekade, PML terus berkembang dan tumbuh menjadi solusi logistik maritim terpercaya oleh perusahaan energi papan atas di Indonesia. Operasi telah disertifikasi oleh standar terbaru dari Organisasi Standar Internasional",
                    textAlign: TextAlign.justify,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
