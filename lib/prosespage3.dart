import 'package:flutter/material.dart';
import 'package:pmlship/OTPPage3.dart';
import 'package:pmlship/prosespage2.dart'; // Import halaman prosespage2

class prosespage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 60, // Sesuaikan ukuran gambar sesuai kebutuhan
              height: 60,
            ),
            SizedBox(width: 10), // Memberikan jarak antara gambar dan teks
            Text(
              'PML SHIP',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Inter', // Menggunakan font Inter
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4682B4), // Ketebalan teks bold
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFDBEFEF), // Warna DBEFEF
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 100.0), // Memberikan padding di bagian atas
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/logo_bundar.png',
                  width: 150.0, // Sesuaikan ukuran gambar sesuai kebutuhan
                  height: 150.0,
                ),
              ),
              Text(
                'Reset Password Proses',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 50.0), // Memberikan padding 50.0 ke bawah
                child: Text(
                  'Mohon Ditunggu',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 50), // Tambahkan jarak sekitar 50
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OTPPage3()), // Navigasi ke prosespage2
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4682B4),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
