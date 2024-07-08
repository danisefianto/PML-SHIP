import 'package:flutter/material.dart';

import '../../home/pages/home_page.dart';

class OTPPage2 extends StatelessWidget {
  const OTPPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 0,
              ),
              child: Image.asset(
                'assets/logo.png',
                height: 500,
                width: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF4682B4)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF4682B4)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Email/Nomor Telepon",
                    hintText: "Input Email/Nomor Telepon",
                    helperText: "ex: danisefianto@yahoo/081xxxx",
                    prefixIcon: const Icon(Icons.mail),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xFF4682B4)),
                    side: WidgetStateProperty.all<BorderSide>(
                      const BorderSide(color: Color(0xFF4682B4)),
                    ),
                  ),
                  child: const Text(
                    "Kirim Kode OTP",
                    style: TextStyle(color: Color(0xFF4682B4)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Masukan 4 Digit Kode OTP",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  // Pinput(
                  //   length: 4,
                  //   defaultPinTheme: defaultPinTheme,
                  //   focusedPinTheme: defaultPinTheme.copyWith(
                  //     decoration: defaultPinTheme.decoration!.copyWith(
                  //       border: Border.all(color: const Color(0xFF4682B4)),
                  //     ),
                  //   ),
                  //   onChanged: (pin) => debugPrint(pin),
                  // ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "00:59",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          // Handle Kirim Ulang Kode
                        },
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xFF4682B4)),
                        ),
                        child: const Text(
                          "Kirim Ulang Kode",
                          style: TextStyle(color: Color(0xFF4682B4)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Tambahkan jarak sekitar 20
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomePage()), // Navigasi ke OTPPage3
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF4682B4), // Warna latar belakang
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Padding button
              ),
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
