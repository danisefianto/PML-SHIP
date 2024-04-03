import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/custom_text_form_field.dart';
import 'package:pml_ship/widgets/custom_search_view.dart';

class BorderRadiusStyle {
  static const BorderRadius roundedBorder5 =
      BorderRadius.all(Radius.circular(5));
  // Add more predefined border radius styles here if needed
}

// ignore: must_be_immutable
class TrackingTwoScreen extends StatelessWidget {
  TrackingTwoScreen({super.key});

  TextEditingController searchController = TextEditingController();
  TextEditingController iDCounterController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController priceController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track your Order'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika ketika tombol pencarian ditekan di sini
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan logika ketika tombol notifikasi ditekan di sini
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Tracking One",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildHeader(),
            _buildTrackingOne(context),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Text(
                "Current Shipment:",
                style: CustomTextStyles.titleSmallInter,
              ),
            ),
            const SizedBox(height: 9),
            _buildCargoShip(context),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                "From:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 7),
            _buildPrice(context),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                "To:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 13),
            _buildPrice1(context),
            const SizedBox(height: 100),
            _buildNext(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Location:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                "Semarang, Indonesia",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingOne(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Track your Order",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(
                  0xFF4682B4), // Mengubah warna menjadi 0xFF4682B4 (warna biru)
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "ID 2024.211.190278",
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                // Tidak ada tombol di sini, hanya ikon pencarian
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCargoShip(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 9, right: 13),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
        decoration: AppDecoration.fillPrimary1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const CustomImageView(
              imagePath: ImageConstant.imgCargoShip30x30,
              height: 30,
              width: 30,
              marginBottom: 10,
            ),
            const SizedBox(width: 10), // Tambahkan jarak antara gambar dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Batu Bara muatan 10 ton dengan jenis tug",
                    style: CustomTextStyles.bodySmallWhiteA700,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Tracking ID 2024.211.29.1920",
                    style: CustomTextStyles.bodySmallWhiteA700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 13),
      child: CustomTextFormField(
        controller: priceController,
        hintText: "Taboneo, Kalimantan 291124",
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildPrice1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 13),
      child: CustomTextFormField(
        controller: priceController1,
        hintText: "Samarinda, Kalimantan 291124",
        textInputAction: TextInputAction.done,
        alignment: Alignment.center,
      ),
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
          onPressed: () {},
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
