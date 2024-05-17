import 'package:flutter/material.dart';
import 'package:pml_ship/core/components/buttons.dart';
import 'widgets/search_bar.dart';
import 'tracking_order_result_screen.dart';
import '../core/styles.dart';

class BorderRadiusStyle {
  static const BorderRadius roundedBorder5 =
      BorderRadius.all(Radius.circular(5));
  // Add more predefined border radius styles here if needed
}

// ignore: must_be_immutable
class TrackingOneScreen extends StatelessWidget {
  TrackingOneScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track your order'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Track your Order'),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {
      //       // Tambahkan logika ketika tombol pencarian ditekan di sini
      //     },
      //   ),
      //   IconButton(
      //     icon: Icon(Icons.notifications),
      //     onPressed: () {
      //       // Tambahkan logika ketika tombol notifikasi ditekan di sini
      //     },
      //   ),
      // ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //   child: Text(
            //     "Tracking One",
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            _buildHeader(),
            _buildTrackingOne(context),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Button.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrackingTwoScreen()),
                  );
                },
                label: 'Next',
              ),
            ),
            const SizedBox(height: 20), // Memindahkan _buildNext ke sini
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Text(
          //   "Track your Order",
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
          // SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(
                  0xFF4682B4), // Mengubah warna menjadi 0xFF4682B4 (warna biru)
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your tracking number",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(height: 10),
                const SearchBarWidget(
                  customHintText: 'ID 2024.211.190278',
                )
                // Row(
                //   children: [
                //     // Expanded(
                //     //   child: CustomSearchView(
                //     //     controller: searchController,
                //     //     hintText: "ID 2024.211.190278",
                //     //     contentPadding: EdgeInsets.all(10),
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildNext(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 40),
  //     child: Align(
  //       alignment: Alignment.center,
  //       child: ElevatedButton(
  //         onPressed: () {

  //         },
  //         child: const Text('Next'),
  //       ),
  //     ),
  //   );
  // }
}
