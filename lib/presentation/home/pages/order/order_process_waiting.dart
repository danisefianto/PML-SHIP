import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../main_page.dart';

class OrderProcessWaitingPage extends StatelessWidget {
  const OrderProcessWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 150,
                ),
                const Icon(
                  Icons.schedule,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Order akan diproses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Text(
                  'Pesanan Anda sedang diverifikasi oleh kami',
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Anda akan mendapatkan notifikasi melalui email',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SpaceHeight(50), // Tambahkan jarak sekitar 50
                SizedBox(
                  height: 50.0,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Back to home',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
