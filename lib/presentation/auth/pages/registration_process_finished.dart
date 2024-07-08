import 'package:flutter/material.dart';

import 'sign_in_page.dart';

class RegistrationProcessFinished extends StatelessWidget {
  const RegistrationProcessFinished({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 60, // Sesuaikan ukuran gambar sesuai kebutuhan
              height: 60,
            ),
            const SizedBox(
                width: 10), // Memberikan jarak antara gambar dan teks
            const Text(
              'PML SHIP',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Inter', // Menggunakan font Inter
                fontWeight: FontWeight.bold,
                color: Color(0xFF4682B4), // Ketebalan teks bold
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFDBEFEF), // Warna DBEFEF
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            top: 100.0), // Memberikan padding di bagian atas
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/logo_centang.png',
                  width: 150.0, // Sesuaikan ukuran gambar sesuai kebutuhan
                  height: 150.0,
                ),
              ),
              const Text(
                'Registrasi telah berhasil',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 50.0), // Memberikan padding 50.0 ke bawah
                child: Text(
                  'Silahkan pilih kapal terbaik kami',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              const Text(
                'Untuk pengiriman domestik dan internasional',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(height: 50), // Tambahkan jarak sekitar 50
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SignInPage()), // Navigasi ke loginpage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4682B4),
                ),
                child: const Text(
                  "Close",
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
