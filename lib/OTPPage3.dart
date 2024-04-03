import 'package:flutter/material.dart';

class OTPPage3 extends StatelessWidget {
  const OTPPage3({Key? key});
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
                'images/logo.png',
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
                    labelText: "Password Baru",
                    hintText: "Input Password Baru",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                    labelText: "Konfirmasi Password Baru",
                    hintText: "Konfirmasi Password Baru",
                    prefixIcon: Icon(Icons.lock),
                    helperText:
                        "*Ketentuan Password\n1. Panjangnya minimal 12 karakter.\n2. Menggunakan huruf besar dan kecil, angka, dan simbol khusus.\n3. Tidak mengandung jalur keyboard yang mudah diingat.\n4. Tidak berdasarkan informasi pribadi Anda.",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
