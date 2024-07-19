import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../core/styles.dart';
import '../widgets/search_bar.dart';
import 'tracking_order_result_screen.dart';

class TrackingOneScreen extends StatefulWidget {
  const TrackingOneScreen({super.key});

  @override
  State<TrackingOneScreen> createState() => _TrackingOneScreenState();
}

class _TrackingOneScreenState extends State<TrackingOneScreen> {
  late final TextEditingController searchController;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                const SearchBarWidget(
                  customHintText: 'ID 2024.211.190278',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
