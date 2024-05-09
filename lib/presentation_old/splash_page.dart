import 'dart:async';

import 'package:flutter/material.dart';
import '../common/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushNamed(context, '/sign-in'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image_ship.jpg',
            fit: BoxFit.cover, // Ensure the image covers the whole screen
            height: double.infinity, // Ensures image takes full height
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, // Gradient starts from top
                end: Alignment.topCenter, // Gradient ends at bottom
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'PML SHIP',
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 17.0,
                    ), // Add some space between texts
                    Text(
                      'Approve pemesanan\nKirim muatan sekarang',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: medium,
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
