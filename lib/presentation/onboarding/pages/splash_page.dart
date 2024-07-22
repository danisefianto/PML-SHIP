import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../auth/pages/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.image.ship.imageShipUnsplash.image(
            height: double.infinity, // Ensures image takes full height
            fit: BoxFit.cover, // Ensure the image covers the whole screen
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, // Gradient starts from top
                end: Alignment.topCenter, // Gradient ends at bottom
                colors: <Color>[
                  AppColors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ],
              ),
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'PML SHIP',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 17.0,
                    ), // Add some space between texts
                    Text(
                      'Approve pemesanan\nKirim muatan sekarang',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center, // Center text horizontally
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
