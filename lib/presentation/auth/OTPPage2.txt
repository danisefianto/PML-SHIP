import 'package:flutter/material.dart';

import '../main_page/home/home_page.dart';

class OTPPage2 extends StatelessWidget {
  const OTPPage2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
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
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4682B4)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4682B4)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Email/Nomor Telepon",
                    hintText: "Input Email/Nomor Telepon",
                    helperText: "ex: danisefianto@yahoo/081xxxx",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: () {
                    print("Tombol OTP ditekan");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF4682B4)),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Color(0xFF4682B4)),
                    ),
                  ),
                  child: Text(
                    "Kirim Kode OTP",
                    style: TextStyle(color: Color(0xFF4682B4)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Masukan 4 Digit Kode OTP",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(height: 8),
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
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "00:59",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          // Handle Kirim Ulang Kode
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF4682B4)),
                        ),
                        child: Text(
                          "Kirim Ulang Kode",
                          style: TextStyle(color: Color(0xFF4682B4)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Tambahkan jarak sekitar 20
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage()), // Navigasi ke OTPPage3
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4682B4), // Warna latar belakang
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Padding button
              ),
              child: Text(
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
