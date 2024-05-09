import 'package:flutter/material.dart';
import '../../../auth/sign_in_page.dart';
import '../../../../core/styles.dart';

class MetodePembayaranPage extends StatelessWidget {
  const MetodePembayaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Text(
                      "Opsi Pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Tidak ada navigasi untuk Pembayaran 1
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 75, // Atur tinggi container menjadi 5
                                color: const Color(0xFF4682B4),
                                child: Center(
                                  child: Text(
                                    "Pembayaran 1",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => MetodePembayaranDuaPage(),
                                builder: (context) => SignInPage(),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 75, // Atur tinggi container menjadi 5
                                color: const Color(0xFF9DB6D4),
                                child: Center(
                                  child: Text(
                                    "Pembayaran 2",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                                // MetodePembayaranEmpatPage(),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 75, // Atur tinggi container menjadi 5
                                color: const Color(0xFF4682B4),
                                child: Center(
                                  child: Text(
                                    "Pembayaran 3",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: _buildCardOrder(context),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                            // builder: (context) => MetodePembayaranSatuPage(),
                          ),
                        );
                      },
                      child: Text('Konfirmasi'))),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'PML SHIP',
        style: primaryTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 14.0,
        ),
      ),
      leading: Icon(Icons.chevron_left),
    );
  }

  Widget _buildCardOrder(BuildContext context) {
    return Container(
      width: 336,
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "2024-02-29T07:25:05+08:00",
            style: primaryTextStyle,
          ),
          SizedBox(height: 9),
          Text(
            "Pembayaran langsung lunas",
            style: primaryTextStyle,
          ),
          SizedBox(height: 16), // Tambahkan jarak antara teks dan tombol
          ElevatedButton(onPressed: () {}, child: Text('Bayar')),

          SizedBox(height: 5),
        ],
      ),
    );
  }

  void onTapkonfirmasi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => MetodePembayaranSatuPage(),
        builder: (context) => SignInPage(),
      ),
    );
  }
}
