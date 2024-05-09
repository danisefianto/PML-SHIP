import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pml_ship/presentation_old/auth/sign_in_page.dart';
import 'package:pml_ship/common/styles.dart';

// Import halaman OTPPage2

class RatingPage1 extends StatefulWidget {
  const RatingPage1({Key? key}) : super(key: key);

  @override
  _RatingPage1State createState() => _RatingPage1State();
}

class _RatingPage1State extends State<RatingPage1> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text(
          'Rate Order',
          style: primaryTextStyle,
        ),
        backgroundColor: const Color(0xFFDBEFEF), // Warna DBEFEF
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Kasih Rating Buat PML SHIP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // RatingBar.builder(
              //   initialRating: rating,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: false,
              //   itemCount: 5,
              //   itemPadding: EdgeInsets.symmetric(
              //       vertical: 150), // Padding antara bintang dengan judul
              //   itemBuilder: (context, _) {
              //     return Icon(
              //       Icons.star,
              //       color: Colors
              //           .amber, // Memberi warna kuning saat bintang diklik
              //     );
              //   },
              //   onRatingUpdate: (rating) {
              //     setState(() {
              //       this.rating = rating;
              //     });
              //   },
              //   updateOnDrag: true,
              //   unratedColor: Colors.grey,
              //   glow: false,
              //   itemSize: 40,
              // ),
              SizedBox(
                  height:
                      10), // Padding antara bintang dengan teks "Apa yang menurutmu oke?"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Apa yang menurutmu oke?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  maxLines: null, // Unlimited lines
                  minLines: 3,
                  style: TextStyle(color: Colors.white), // Ubah warna teks
                  decoration: InputDecoration(
                    hintText: 'Tulis di sini...',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    filled: true, // Mengaktifkan fill
                    fillColor: const Color(0xFF4682B4), // Warna fill kolom
                  ),
                  textAlign: TextAlign.center, // Posisi teks di tengah
                ),
              ),
              SizedBox(height: 20), // Tambahkan jarak sekitar 20
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignInPage()), // Navigasi ke OTPPage3
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RatingPage1(),
  ));
}
