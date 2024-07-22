import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/search_bar.dart';
import 'tracking_order_result_page.dart';

class TrackingOrderPage extends StatefulWidget {
  const TrackingOrderPage({super.key});

  @override
  State<TrackingOrderPage> createState() => _TrackingOrderPageState();
}

class _TrackingOrderPageState extends State<TrackingOrderPage> {
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
            const SpaceHeight(100),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Button.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrackingOrderResultPage()),
                  );
                },
                label: 'Next',
              ),
            ),
            const SpaceHeight(20), // Memindahkan _buildNext ke sini
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
                  color: AppColors.black,
                ),
              ),
              Text(
                "Semarang, Indonesia",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
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
          const SpaceHeight(20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(
                  0xFF4682B4), // Mengubah warna menjadi 0xFF4682B4 (warna biru)
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your tracking number",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
                SearchBarWidget(
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
